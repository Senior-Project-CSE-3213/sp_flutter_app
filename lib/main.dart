import 'package:flutter/material.dart';
import 'package:user_profile_app/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
