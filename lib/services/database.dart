import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/models/event.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference simpleProfileCollection =
      FirebaseFirestore.instance.collection('simple');

  Future updateSimpleUserData(String name, String email, String phone,
      List<Event> myEvents, List<Event> eventsSignedUpFor) async {
    return await simpleProfileCollection.doc(uid).set({
      'displayName': name,
      'email': email,
      'phoneNumber': phone,
      // 'myEvents': myEvents,
      // 'eventsSignedUpFor': eventsSignedUpFor
    });
  }

  // User data from snapshots
  User _userFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: uid,
      username: snapshot['displayName'],
      email: snapshot['email'],
      phoneNumber: snapshot['phoneNumber'],
      // myEvents: snapshot['myEvents'],
      // eventsSignedUpFor: snapshot['eventsSignedUpFor']
    );
  }

  // Profile details from snapshot
  List<User> _profileListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return User(
        uid: doc.data()['uid'] ?? '',
        username: doc.data()['displayName'] ?? '',
        email: doc.data()['email'] ?? '',
        phoneNumber: doc.data()['phoneNumber'] ?? '',
        // myEvents: doc.data()['myEvents'] ?? new List<Event>(),
        // eventsSignedUpFor: doc.data()['eventsSignedUpFor'] ?? new List<Event>(),
      );
    }).toList();
  }

  // Get stream
  Stream<List<User>> get profiles {
    return simpleProfileCollection.snapshots().map(_profileListFromSnapShot);
  }

  // Get user data
  Stream<User> get userData {
    return simpleProfileCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }
}
