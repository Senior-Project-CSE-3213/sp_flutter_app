import 'package:sp_flutter_app/models/user.dart';

class Event {
  User creator;
  String eventName;
  String eventDescription;
  DateTime eventDate;
  List<String> participants;

  Event({
    this.creator,
    this.eventName,
    this.eventDescription,
    this.eventDate,
    this.participants,
  });

  // Event.fromMap(Map<String, dynamic> data) {
  //   creator = User.fromFirebase(data['creator']);
  //   eventName = data['eventName'] as String;
  //   eventDescription = data['eventDescription'] as String;
  //   eventDate = data['eventDate'] as DateTime;
  // }

  Map<String, dynamic> toMap() {
    return {
      'creator': creator.uid,
      'eventName': eventName,
      'eventDescription': eventDescription,
      'eventDate': eventDate,
      'participants': participants
    };
  }

  // TODO: Needs to be a Firestore query
  addParticipant(User participant) {
    if (!participants.contains(participant.uid))
      participants.add(participant.uid);
  }
}

class EventArguments {
  Event event;

  EventArguments({this.event});
}
