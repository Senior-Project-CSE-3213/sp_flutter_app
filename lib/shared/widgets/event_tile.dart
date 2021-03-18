import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/event.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/views/profile.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:intl/intl.dart';

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
            selected: false,
            onTap: () {
              Navigator.pushNamed(context, eventDetailScreenRoute,
                  arguments: EventArguments(event: event));
            },
            isThreeLine: true,
            leading: Icon(
              Icons.event,
              size: 50,
              color: blueColor,
            ),
            title: Text(event.eventName,
                style: TextStyle(color: primaryLightColor, fontSize: 20)),
            subtitle: Text(
                event.creator.username +
                    "\n" +
                    new DateFormat("MM-dd-yyyy @hh:mm a'")
                        .format(event.eventDate),
                style: TextStyle(color: labelTextColor, fontSize: 16)),
            tileColor: primaryColor,
          ),
        ));
  }
}
