import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/models/user_profile.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentReference> addUserProfile(UserProfile userProfileModel) async {
    return await _firestore
        .collection("user_profiles")
        .add(userProfileModel.toFirebase());
  }

  Future<bool> updateUserProfile(
      UserProfile userProfileModel, DocumentReference ref) async {
    try {
      await _firestore
          .collection("user_profiles")
          .doc(ref.path)
          .update(userProfileModel.toFirebase());
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<UserProfile> getUserProfile(User user) async {
    try {
      UserProfile userProfile;
      // query the user_profiles collection for the specific users uid
      // then get that specific document and map the data to the
      // UserProfile object and return it
      await _firestore
          .collection("user_profiles")
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        userProfile = UserProfile.fromFirebase(documentSnapshot.data());
        return;
      });
      return userProfile;
    } catch (error) {
      print(error);
      return null;
      // handle different?
    }
  }

  Future<void> getEvents() async {
    QuerySnapshot querySnapshot = await _firestore.collection("events").get();

    final eventData = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
