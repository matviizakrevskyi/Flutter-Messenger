import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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
        // Check if the email contains the search term
        if (value['email'].toString().toLowerCase().contains(searchTerm.toLowerCase())) {
          // Add user to the list
          users.add(User(key, value['email'], value['name']));
        }
      });

      return users;
    } catch (e) {
      print('Error searching users: $e');
      return [];
    }
  }
}
