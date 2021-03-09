import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/event.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/services/database.dart';
import 'package:sp_flutter_app/shared/response.dart';

class UserViewModel extends ChangeNotifier {
  AuthService _auth = AuthService();

  // declare state variable of type Response<User> so we can set
  // loading, complete, and error
  Response<User> viewModelResponse = Response<User>();
  User user;

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

      // await DatabaseService(uid: user.uid)
      //     .updateSimpleUserData(user.username, user.email, user.phoneNumber);

      var people = new List<String>();
      people.add(user.uid);
      people.add('qQ9QXNx915g7Xsi8TwSILwAs2ZI2');

      // TODO: Delete this
      // Event genericEvent = new Event(
      //     creator: user,
      //     eventName: 'Giant Event',
      //     eventDescription: "A description for this GIANT event!",
      //     eventDate: new DateTime.now(),
      //     participants: people);

      // await DatabaseService(uid: user.uid).updateEventData(genericEvent);
    } catch (exception) {
      print(exception);
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
      _setViewModelState(Response.complete<User>(user));
    } catch (exception) {
      _setViewModelState(
          Response.error<User>("Unable to register with email and password."));
    }
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
