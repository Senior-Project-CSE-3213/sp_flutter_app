import 'package:sp_flutter_app/models/event.dart';

class User {
  String uid;
  String username;
  String email;
  String phoneNumber;

  // Could keep both lists and fill them when user logs in from Firestore
  List<Event> myEvents = new List<Event>();
  List<Event> eventsSignedUpFor = new List<Event>();

  User(
      {this.uid,
      this.username,
      this.email,
      this.phoneNumber,
      this.myEvents,
      this.eventsSignedUpFor});

  /*
    Desc: This method will take the data from the firebase query and map it to this User instance.
  */
  User.fromFirebase(Map<String, dynamic> data) {
    uid = data['uid'];
    username = data['displayName'];
    email = data['email'];
    phoneNumber = data['phoneNumber'];
  }

  Map<String, dynamic> toFirebase() {
    return {
      'uid': uid,
      'displayName': username,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  setUsername(final String username) {
    this.username = username;
  }

  String getUsername() {
    return this.username;
  }

  setEmail(final String email) {
    this.email = email;
  }

  String getEmail() {
    return this.email;
  }

  setPhoneNumber(final String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  String getPhoneNumber() {
    return this.phoneNumber;
  }

  update() => this.toFirebase();

  // TODO: Need to prevent user from creating event with same name
  // createNewEvent(final EventArguments args) {
  //   Event newEvent = new Event(
  //       creator: this,
  //       eventName: args.eventName,
  //       eventDescription: args.eventDescription,
  //       eventDate: args.eventDate);

  //   this.myEvents.add(newEvent);
  // }
}
