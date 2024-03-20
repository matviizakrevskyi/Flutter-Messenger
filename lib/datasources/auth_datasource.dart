import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasource {
  AuthDatasource();

  signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Error at registration: $e');
    }
  }

  signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Error at SignIn: $e');
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
