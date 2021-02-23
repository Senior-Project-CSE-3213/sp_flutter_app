import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/event.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/views/profile.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class EventTile extends StatelessWidget {
  final Event event;

  EventTile({this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.grey,
            ),
            title: Text(event.eventName),
            subtitle: Text(event.creator.username),
          ),
        ));
  }
}
