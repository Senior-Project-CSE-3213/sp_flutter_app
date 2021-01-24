import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          backgroundColor: mainColor,
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
      selectedItemColor: mainColor,
      onTap: _onItemTapped,
    );
  }
}

class BottomBar extends StatefulWidget {
  State<StatefulWidget> createState() => BottomBarState();
}
