import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_messenger/domain/user.dart' as domain;

class AuthDatasource {
  final DatabaseReference _database = FirebaseDatabase.instanceFor(
          databaseURL:
              "https://flutter-messenger-9f068-default-rtdb.europe-west1.firebasedatabase.app",
          app: Firebase.app())
      .ref();

  AuthDatasource();

  Future<String?> signUp(String email, String password, String name, int avatarColor) async {
    try {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await _database
          .child("users")
          .child(user.user?.uid ?? '')
          .child("userData")
          .set({"email": user.user?.email, "name": name, "avatarColor": avatarColor});

      return user.user?.uid;
    } catch (e) {
      throw Exception('Error at registration: $e');
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      final user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      return user.user?.uid;
    } catch (e) {
      throw Exception('Error at SignIn: $e');
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<domain.User?> getUserData(String uid) async {
    try {
      final userData = (await _database.child('users/$uid/userData').get()).value;
      if(userData != null) {
        return domain.User(
            uid, (userData as Map)['email'], userData['name'], Color(userData['avatarColor']));
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error at getNameOfUser: $e');
    }
  }
}
