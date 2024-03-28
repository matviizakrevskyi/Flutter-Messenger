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
        if (key != userId && value['email'].toString().toLowerCase().contains(searchText.toLowerCase())) {
          users.add(User(key, value['email'], value['name']));
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
        "user": {"id": users[1].id, "name": users[1].name, "email": users[1].email},
        "lastMessage": {
          "id": message.id,
          "message": message.text,
          "time": message.time.millisecondsSinceEpoch,
          "userId": message.userId,
        }
      });
      await _database.child("users/${users[1].id}/userChats/$chatId").set({
        "user": {"id": users[0].id, "name": users[0].name, "email": users[0].email},
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

      (dataSnapshot.value as Map).forEach((key, value) {
        final User user = User(value['user']['id'], value['user']['email'], value['user']['name']);
        final Message lastMessage = Message(
            value['lastMessage']['id'],
            value['lastMessage']['message'],
            value['lastMessage']['userId'],
            DateTime.fromMillisecondsSinceEpoch(value['lastMessage']['time']));
        chats.add(Chat(key, user, lastMessage));
      });

      return chats;
    } catch (e) {
      print('Error during getting user chats data: $e');
      return [];
    }
  }

  Stream<List<Chat>> getUserChatsDataStream(String userId) {
    return _database.child("users/$userId/userChats").onValue.map((event) {
      if (event.snapshot.value == null) {
        return [];
      }
      List<Chat> chats = [];
      (event.snapshot.value as Map).forEach((key, value) {
        final User user = User(value['user']['id'], value['user']['email'], value['user']['name']);
        final Message lastMessage = Message(
            value['lastMessage']['id'],
            value['lastMessage']['message'],
            value['lastMessage']['userId'],
            DateTime.fromMillisecondsSinceEpoch(value['lastMessage']['time']));
        chats.add(Chat(key, user, lastMessage));
      });
      return chats;
    });
  }
}
