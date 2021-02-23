import 'package:sp_flutter_app/models/event.dart';

class User {
  String uid;
  String username;
  String email;
  String phoneNumber;

  List<Event> myEvents;
  List<Event> eventsSignedUpFor;

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
    // myEvents = data['myEvents'];
    // eventsSignedUpFor = data['eventsSignedUpFor'];
  }

  Map<String, dynamic> toFirebase() {
    return {
      'uid': uid,
      'displayName': username,
      'email': email,
      'phoneNumber': phoneNumber,
      // 'myEvents': myEvents,
      // 'eventsSignedUpFor': eventsSignedUpFor
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

  createNewEvent(final EventArguments args) {
    Event newEvent = new Event(
        creator: this,
        eventName: args.eventName,
        eventDescription: args.eventDescription,
        eventDate: args.eventDate);

    this.myEvents.add(newEvent);
  }
}
