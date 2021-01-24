import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class NotificationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: mainColor,
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 25,
                  margin: EdgeInsets.only(
                    top: 35,
                  ),
                ),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
