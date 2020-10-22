import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:sp_flutter_app/data/models/user.dart';

class AuthService {
  final fbAuth.FirebaseAuth _auth = fbAuth.FirebaseAuth.instance;

  // create user model based on firebase user
  User _userFromFirebaseUser(fbAuth.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      fbAuth.UserCredential result = await _auth.signInAnonymously();
      fbAuth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      throw throw ("Unable to sign in anonymously.");
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      fbAuth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      fbAuth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email/password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      fbAuth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      fbAuth.User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
