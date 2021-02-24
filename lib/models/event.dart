import 'package:sp_flutter_app/models/user.dart';

class Event {
  User creator;
  String eventName;
  String eventDescription;
  DateTime eventDate;
  List<User> participants;

  Event({this.creator, this.eventName, this.eventDescription, this.eventDate});

  Event.fromMap(Map<String, dynamic> data) {
    creator = User.fromFirebase(data['creator']);
    eventName = data['eventName'] as String;
    eventDescription = data['eventDescription'] as String;
    eventDate = data['eventDate'] as DateTime;
  }

  Map<String, dynamic> toMap() {
    return {
      'creator': creator.toFirebase(),
      'eventName': eventName,
      'eventDescription': eventDescription,
      'eventDate': eventDate
    };
  }

  addParticipant(User participant) {
    if (!participants.contains(participant)) participants.add(participant);
  }
}

class EventArguments {
  Event event;

  EventArguments({this.event});
}
