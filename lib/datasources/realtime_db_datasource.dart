import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:flutter_messenger/domain/user.dart';

class RealtimeDatabaseDatasource {
  final DatabaseReference _database = FirebaseDatabase.instanceFor(
          databaseURL:
              "https://flutter-messenger-9f068-default-rtdb.europe-west1.firebasedatabase.app",
          app: Firebase.app())
      .ref();

  Future<List<User>> searchUsersByEmail(String searchTerm) async {
    List<User> users = [];

    try {
      DataSnapshot dataSnapshot = await _database.child('users').get();

      (dataSnapshot.value as Map).forEach((key, value) {
        if (value['email'].toString().toLowerCase().contains(searchTerm.toLowerCase())) {
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
}
