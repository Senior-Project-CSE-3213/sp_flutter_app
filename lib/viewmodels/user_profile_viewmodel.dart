import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/models/user_profile.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/services/firestore.dart';
import 'package:sp_flutter_app/shared/response.dart';

class UserProfileViewModel extends ChangeNotifier {
  AuthService _auth = AuthService();
  FirestoreService _firestore = FirestoreService();

  // declare state variable of type Response<User> so we can set
  // loading, complete, and error
  Response<UserProfile> viewModelResponse = Response<UserProfile>();
  UserProfile userProfile = UserProfile();

  void _setViewModelState(Response response) {
    viewModelResponse = response;
    notifyListeners();
  }

  // add user profile to database
  Future<void> registerUserProfile() async {
    _setViewModelState(Response.loading<UserProfile>());
    try {
      await _firestore.addUserProfile(userProfile);
      _setViewModelState(Response.complete<UserProfile>(userProfile));
    } catch (exception) {
      print(exception.toString());
      _setViewModelState(
          Response.error<UserProfile>("Unable to register user profile."));
    }
  }

  Future<bool> populateUserProfile(User user) async {
    try {
      userProfile = await _firestore.getUserProfile(user);
      if (userProfile.uid != null)
        return true;
      else
        return false;
    } catch (exception) {
      return false;
    }
  }
}
