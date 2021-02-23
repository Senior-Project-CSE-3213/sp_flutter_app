import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sp_flutter_app/models/event.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/event_tile.dart';
import 'package:sp_flutter_app/shared/widgets/profile_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventList extends StatefulWidget {
  final List<Event> events;
  final Axis direction;

  EventList({this.events, this.direction});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final list = widget.events;
    return ListView.builder(
        scrollDirection: widget.direction,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return EventTile(event: list[index]);
        });
  }
}
