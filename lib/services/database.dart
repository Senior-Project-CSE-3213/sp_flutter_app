import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/models/event.dart';

class DatabaseService {
  final String uid;
  final User thisUser;

  DatabaseService({this.uid, this.thisUser});

  final CollectionReference simpleProfileCollection =
      FirebaseFirestore.instance.collection('Users');

  Future updateSimpleUserData(String name, String email, String phone) async {
    return await simpleProfileCollection.doc(uid).set({
      'displayName': name,
      'email': email,
      'phoneNumber': phone,
    });
  }

  Future updateEventData(Event event) async {
    return await simpleProfileCollection
        .doc(uid)
        .collection('Events')
        .doc(event.eventName)
        .set(event.toMap());
  }

  User _userFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: snapshot.id,
      username: snapshot['displayName'],
      email: snapshot['email'],
      phoneNumber: snapshot['phoneNumber'],
    );
  }

  List<Event> _eventsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Timestamp timestamp = doc.data()['eventDate'];
      List<String> participantsUids = List.from(doc.data()['participants']);

      return Event(
          creator: thisUser,
          eventName: doc.data()['eventName'],
          eventDescription: doc.data()['eventDescription'],
          eventDate: timestamp.toDate(),
          participants: participantsUids);
    }).toList();
  }

  List<User> _profileListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return User(
          uid: doc.id ?? '',
          username: doc.data()['displayName'] ?? '',
          email: doc.data()['email'] ?? '',
          phoneNumber: doc.data()['phoneNumber'] ?? '');
    }).toList();
  }

  Stream<List<User>> get profiles =>
      simpleProfileCollection.snapshots().map(_profileListFromSnapShot);

  Stream<User> get userData =>
      simpleProfileCollection.doc(uid).snapshots().map(_userFromSnapshot);

  Stream<List<Event>> get userCreatedEvents => simpleProfileCollection
      .doc(uid)
      .collection('Events')
      .snapshots()
      .map(_eventsFromSnapshot);
}
