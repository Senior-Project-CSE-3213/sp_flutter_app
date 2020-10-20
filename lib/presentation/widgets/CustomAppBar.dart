import 'package:flutter/material.dart';

import 'package:sp_flutter_app/services/auth.dart';

class CustomAppBarState extends State<CustomAppBarClass> {

  final AuthService _auth = AuthService();
  build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),

    );
  }
}

class CustomAppBarClass extends StatefulWidget {
  State<StatefulWidget> createState() => CustomAppBarState();
}


