import 'package:flutter/material.dart';
import 'package:sp_flutter_app/presentation/widgets/CustomAppBar.dart';
import 'package:sp_flutter_app/presentation/widgets/Map.dart';

import 'package:sp_flutter_app/services/auth.dart';



class BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final AuthService _auth = AuthService();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Map(),
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
      drawer: CustomAppBarClass(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey[111],
        onTap: _onItemTapped,
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  State<StatefulWidget> createState() => BottomBarState();
}