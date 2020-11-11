import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:sp_flutter_app/models/user.dart';

class AuthService {
  // Singleton instance
  static final AuthService _singleton = AuthService._();

  // firebase authentication instance
  static final fbAuth.FirebaseAuth _auth = fbAuth.FirebaseAuth.instance;

  // Singleton accessor
  static AuthService get instance => _singleton;

  factory AuthService() {
    return _singleton;
  }

  AuthService._();

  // create user model based on firebase user
  User _userFromFirebaseUser(fbAuth.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anonymously
  Future<User> signInAnon() async {
    try {
      fbAuth.UserCredential result = await _auth.signInAnonymously();
      fbAuth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // TODO: handle different
      throw throw ("Unable to sign in anonymously.");
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      fbAuth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      fbAuth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // TODO: handle different
      throw throw ("Unable to sign in with email and password.");
    }
  }

  // register with email/password
  Future<User> registerWithEmailAndPassword(String email, String password) async {
    try {
      fbAuth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      fbAuth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // TODO: handle different
      throw throw ("Unable to register in with email and password.");
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // TODO: handle different
      throw throw ("Unable to sign out.");
    }
  }
}
