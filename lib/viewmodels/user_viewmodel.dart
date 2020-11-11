import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/services/auth.dart';

class UserViewModel extends ChangeNotifier {
  AuthService _auth = AuthService();

  // auth change user stream from auth service
  Stream<User> get user {
    return _auth.user;
  }

  // sign in anonymously
  Future<User> signInAnon() async {
    return _auth.signInAnon();
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    return _auth.signInWithEmailAndPassword(email, password);
  }

  // register with email/password
  Future<User> registerWithEmailAndPassword(String email, String password) async {
    return _auth.registerWithEmailAndPassword(email, password);
  }

  // sign out
  Future<void> signOut() async {
    _auth.signOut();
  }
}