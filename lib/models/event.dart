import 'package:sp_flutter_app/models/user.dart';

class Event {
  User creator;
  String eventName;
  String eventDescription;
  DateTime eventDate;
  List<User> participants;

  Event({this.creator, this.eventName, this.eventDescription, this.eventDate});

  addParticipant(User participant) {
    if (!participants.contains(participant)) participants.add(participant);
  }
}

class EventArguments {
  String eventName;
  String eventDescription;
  DateTime eventDate;

  EventArguments(
      {this.eventName, this.eventDescription, this.eventDate});
}
