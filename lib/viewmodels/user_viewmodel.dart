import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/services/firestore.dart';
import 'package:sp_flutter_app/shared/response.dart';

class UserViewModel extends ChangeNotifier {
  AuthService _auth = AuthService();
  FirestoreService _firestore = FirestoreService();

  // declare state variable of type Response<User> so we can set
  // loading, complete, and error
  Response<User> viewModelResponse = Response<User>();
  User user = User();

  bool profileCreated = false;
  String registrationEmail;

  // auth change user stream from auth service
  Stream<User> get userStream {
    return _auth.user;
  }

  void _setViewModelState(Response response) {
    viewModelResponse = response;
    notifyListeners();
  }

  // sign in anonymously
  Future<void> signInAnon() async {
    _setViewModelState(Response.loading<User>());
    try {
      user = await _auth.signInAnon();
      _setViewModelState(Response.complete<User>(user));
    } catch (exception) {
      _setViewModelState(
          Response.error<User>("Unable to sign in anonymously."));
    }
  }

  // sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _setViewModelState(Response.loading<User>());
    try {
      user = await _auth.signInWithEmailAndPassword(email, password);
      _setViewModelState(Response.complete<User>(user));
    } catch (exception) {
      _setViewModelState(
          Response.error<User>("Unable to sign in with email and password."));
    }
  }

  // register with email/password
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    _setViewModelState(Response.loading<User>());
    try {
      user = await _auth.registerWithEmailAndPassword(email, password);
      // need to setup the profile
      // _firestore.addUserProfile();
      _setViewModelState(Response.complete<User>(user));
    } catch (exception) {
      _setViewModelState(
          Response.error<User>("Unable to register with email and password."));
    }
  }

  // useful for getting the current user
  getCurrentUser() {
    return _auth.getCurrentUser();
  }

  // populate user model
  populateUserModelFromFirebase() {
    user = getCurrentUser();
  }

  // sign out
  Future<void> signOut() async {
    _auth.signOut();
    // sign out was successful so set user to null
    // TODO: this could be error prone since the UI is going to automatically
    //       go to the login screen when signing out
    user = null;
  }
}
