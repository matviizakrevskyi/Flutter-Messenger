import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_messenger/domain/chat.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:flutter_messenger/domain/user.dart';

class RealtimeDatabaseDatasource {
  final DatabaseReference _database = FirebaseDatabase.instanceFor(
          databaseURL:
              "https://flutter-messenger-9f068-default-rtdb.europe-west1.firebasedatabase.app",
          app: Firebase.app())
      .ref();

  Future<List<User>> searchUsersByEmail(String searchText, String userId) async {
    List<User> users = [];

    try {
      DataSnapshot dataSnapshot = await _database.child('users').get();

      (dataSnapshot.value as Map).forEach((key, value) {
        if (key != userId &&
            value['userData']['email']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase())) {
          users.add(User(key, value['userData']['email'], value['userData']['name'],
              Color(value['userData']['avatarColor'])));
        }
      });

      return users;
    } catch (e) {
      print('Error searching users: $e');
      return [];
    }
  }

  Future<String?> getChatId(String userId, String anotherUserId) async {
    try {
      DataSnapshot dataSnapshot = await _database.child('chats').get();

      for (String key in (dataSnapshot.value as Map).keys) {
        List<String> ids = key.split("-");
        if (ids.contains(userId) && ids.contains(anotherUserId)) {
          return key;
        }
      }

      return null;
    } catch (e) {
      print('Error during getting chat id: $e');
      return null;
    }
  }

  Future<List<Message>> getChatData(String chatId) async {
    List<Message> messages = [];

    try {
      DataSnapshot dataSnapshot = await _database.child('chats/$chatId').get();

      (dataSnapshot.value as Map).forEach((key, value) {
        messages.add(Message(key, value["message"], value["userId"],
            DateTime.fromMillisecondsSinceEpoch(value["time"])));
      });
      return messages;
    } catch (e) {
      print('Error during fetching chat data: $e');
      return [];
    }
  }

  Stream<List<Message>> getChatDataStream(String chatId) {
    return _database.child("chats/$chatId").onValue.map((event) {
      List<Message> messages = [];
      if (event.snapshot.value == null) {
        return [];
      }
      (event.snapshot.value as Map).forEach((key, value) {
        messages.add(Message(key, value["message"], value["userId"],
            DateTime.fromMillisecondsSinceEpoch(value["time"])));
      });
      return messages;
    });
  }

  Future<void> sendMessage(String chatId, Message message) async {
    try {
      await _database.child("chats").child(chatId).child(message.id).set({
        "message": message.text,
        "userId": message.userId,
        "time": message.time.millisecondsSinceEpoch
      });
    } catch (e) {
      print('Error during sending message: $e');
    }
  }

  Future<void> updateUserChatsData(String chatId, Message message, List<User> users) async {
    try {
      await _database.child("users/${users[0].id}/userChats/$chatId").set({
        "user": {"id": users[1].id},
        "lastMessage": {
          "id": message.id,
          "message": message.text,
          "time": message.time.millisecondsSinceEpoch,
          "userId": message.userId,
        }
      });
      await _database.child("users/${users[1].id}/userChats/$chatId").set({
        "user": {"id": users[0].id},
        "lastMessage": {
          "id": message.id,
          "message": message.text,
          "time": message.time.millisecondsSinceEpoch,
          "userId": message.userId,
        }
      });
    } catch (e) {
      print('Error during updating users chats data: $e');
    }
  }

  Future<List<Chat>> getUserChatsData(String userId) async {
    List<Chat> chats = [];
    try {
      DataSnapshot dataSnapshot = await _database.child("users/$userId/userChats").get();

      (dataSnapshot.value as Map).forEach((key, value) async {
        //getting data of chat user
        final String anotherUserId = value['user'];
        final userData = (await _database.child("users/$anotherUserId").get()).value as Map;
        final User user = User(
            anotherUserId, userData["email"], userData["name"], Color(userData["avatarColor"]));

        //getting data of last message of chat
        final Message lastMessage = Message(
            value['lastMessage']['id'],
            value['lastMessage']['message'],
            value['lastMessage']['userId'],
            DateTime.fromMillisecondsSinceEpoch(value['lastMessage']['time']));

        //adding chat to chats
        chats.add(Chat(key, user, lastMessage));
      });

      return chats;
    } catch (e) {
      print('Error during getting user chats data: $e');
      return [];
    }
  }

  //Todo: Check later how it work
  Stream<List<Chat>> getUserChatsDataStream(String userId) async* {
    await for (var event in _database.child("users/$userId/userChats").onValue) {
      if (event.snapshot.value == null) {
        yield [];
      } else {
        List<Chat> chats = [];
        await Future.forEach((event.snapshot.value as Map).entries, (entry) async {
          final key = entry.key;
          final value = entry.value;

          // Getting data of chat user
          final String anotherUserId = value['user']['id'];
          final userData =
              (await _database.child("users/$anotherUserId/userData").get()).value as Map;
          final User user = User(
            anotherUserId,
            userData["email"],
            userData["name"],
            Color(userData["avatarColor"]),
          );

          // Getting data of last message of chat
          final Message lastMessage = Message(
            value['lastMessage']['id'],
            value['lastMessage']['message'],
            value['lastMessage']['userId'],
            DateTime.fromMillisecondsSinceEpoch(value['lastMessage']['time']),
          );

          // Adding chat to chats
          chats.add(Chat(key, user, lastMessage));
        });
        yield chats;
      }
    }
  }

  Stream<User?> getUserDataStream(String userId) {
    return _database.child("users/$userId/userData").onValue.map((event) {
      final value = event.snapshot.value;
      if (value != null) {
        return User(userId, (value as Map)['email'], value['name'], Color(value['avatarColor']));
      } else {
        return null;
      }
    });
  }

  Future<void> changeUserData(User user) async {
    await _database
        .child("users")
        .child(user.id)
        .child("userData")
        .set({"email": user.email, "name": user.name, "avatarColor": user.avatarColor.value});
  }
}
