import 'package:flutter/material.dart';
import 'package:sp_flutter_app/presentation/widgets/event_map.dart';
import 'package:sp_flutter_app/presentation/widgets/bottom_bar.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/shared/constants.dart';

import 'file:///E:/SeniorProject/sp_flutter_app/lib/presentation/widgets/main_drawer.dart';
import 'file:///E:/SeniorProject/sp_flutter_app/lib/presentation/widgets/notification_drawer.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
        backgroundColor: mainColor,
        textTheme: TextTheme(
          headline5: TextStyle(color: Colors.white),
        ),
        //elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              print("Clicked chat");
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      endDrawer: NotificationDrawer(),
      body: EventMap(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
