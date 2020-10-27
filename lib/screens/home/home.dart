import 'package:flutter/material.dart';
import 'package:sp_flutter_app/widgets/event_map.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return EventMap();
  }
}
