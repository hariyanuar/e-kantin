import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  AuthenticationService(this._firebaseAuth);

  Future<String> signIn (String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in successfully!';
    }
    on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut () async {
    try {
      await _firebaseAuth.signOut();
      return 'Signed out successfully!';
    }
    on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}