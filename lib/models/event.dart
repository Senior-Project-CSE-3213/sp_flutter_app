import 'package:sp_flutter_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/services/database.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/loading.dart';
import 'package:sp_flutter_app/shared/response.dart';
import 'package:sp_flutter_app/shared/widgets/date_time_picker.dart';
import 'package:sp_flutter_app/shared/widgets/flutter_stateful_dialog.dart';
import 'package:sp_flutter_app/shared/widgets/generic_alerts.dart';
import 'package:sp_flutter_app/viewmodels/user_viewmodel.dart';

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
  Future addParticipant(BuildContext context, User participant) async {
    if (!participants.contains(participant.uid)) {
      participants.add(participant.uid);
      await DatabaseService(uid: creator.uid)
          .updateEventData(this)
          .then((value) {
        AlertDialogArgs args = new AlertDialogArgs(
            title: "Successfully signed up for this event!");

        alertDialog(context, args);
      });
    } else {
      AlertDialogArgs args = new AlertDialogArgs(
          title: "You are already signed up for this event!");

      alertDialog(context, args);
    }
  }
}

class EventArguments {
  Event event;

  EventArguments({this.event});
}

class EventCreationForm extends StatefulWidget {
  final User creator;

  EventCreationForm({this.creator});

  @override
  _EventCreationFormState createState() =>
      _EventCreationFormState(eventCreator: creator);
}

class _EventCreationFormState extends State<EventCreationForm> {
  final _formKey = GlobalKey<FormState>();
  final User eventCreator;

  _EventCreationFormState({this.eventCreator});

  bool loading = false;
  String eventName = '';
  String eventDescription = '';
  String error = '';

  DateTimePicker dateTimePicker = new DateTimePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      //height: 400,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: 10.0),
              Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Expanded(child: Text("Name: ")),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter name for event'),
                    validator: (val) => val.isEmpty ? 'Enter a name' : null,
                    onChanged: (val) {
                      setState(() => eventName = val);
                    },
                  ),
                ),
              ]),
              SizedBox(height: 20.0),
              Row(children: <Widget>[
                Expanded(child: Text("Description: ")),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter a description for event'),
                    validator: (val) =>
                        val.isEmpty ? 'Enter a description' : null,
                    onChanged: (val) {
                      setState(() => eventDescription = val);
                    },
                  ),
                ),
              ]),
              SizedBox(height: 20.0),
              Row(children: <Widget>[
                Expanded(child: Text("Date: ")),
                Expanded(flex: 3, child: dateTimePicker),
              ]),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.deepOrange[400],
                child: Text(
                  'Create Event',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    Event event = new Event(
                        creator: eventCreator,
                        eventName: eventName,
                        eventDescription: eventDescription,
                        eventDate: createdEventDate,
                        participants: new List<String>());
                    await DatabaseService(uid: eventCreator.uid)
                        .updateEventData(event);
                    print(eventCreator.email);
                    Navigator.of(context).pop();
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
