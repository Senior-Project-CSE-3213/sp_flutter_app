import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/data/models/user.dart';
import 'package:sp_flutter_app/presentation/widgets/event_map.dart';
import 'package:sp_flutter_app/services/auth.dart';

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
