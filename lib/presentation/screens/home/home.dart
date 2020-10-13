import 'package:flutter/material.dart';
import 'package:sp_flutter_app/presentation/widgets/Map.dart';
import 'package:sp_flutter_app/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: Text('SP App'),
          backgroundColor: Colors.grey[350],
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Map(),
      ),
    );
  }
}
