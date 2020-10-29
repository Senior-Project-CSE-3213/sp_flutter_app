import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings and stuff',
              style: TextStyle(
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
