import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthDatasource {
  final DatabaseReference _database = FirebaseDatabase.instanceFor(
          databaseURL:
              "https://flutter-messenger-9f068-default-rtdb.europe-west1.firebasedatabase.app",
          app: Firebase.app())
      .ref();

  AuthDatasource();

  Future<void> signUp(String email, String password, String name) async {
    try {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await _database
          .child("users")
          .child(user.user?.uid ?? '')
          .set({"email": user.user?.email, "name": name});
    } catch (e) {
      throw Exception('Error at registration: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Error at SignIn: $e');
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
