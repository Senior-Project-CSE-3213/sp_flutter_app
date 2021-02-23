import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);

const mainColor = Colors.indigoAccent;
const kPrimaryColor = Color(0xFF6C63FF);
const kPrimaryLightColor = Color(0xFFDEDEDE);

const altPrimaryColor = Color(0xFF0D47A1);
const altSecondaryColor = Color(0xFF2979FF);
//const altSecondaryColor = Colors.lightBlueAccent;

const profileScreenRoute = '/screens/profile_screen.dart';
const settingScreenRoute = '/screens/settings_screen.dart';
const helpScreenRoute = '/screens/help_screen.dart';
const eventMapScreenRoute = '/screens/event_map.dart';
const eventDetailScreenRoute = '/screens/event_detail_view.dart';
const allUserProfilesScreenRoute = '/screens/user_profiles.dart';

const freshPrinceText = Text(
    "This is a story all about how my life got flipped, turned upside down. And I'd like to take a minute and sit right there and tell you how I became the prince of a town called Bel-Air. In West Philadelphia, born and raised, On the playground is where I spent most of my days. Chillin' out, maxin', relaxin all cool, And all shootin' some B-ball outside of the school. When a couple of guys who were up to no good, Started makin' trouble in my neighborhood., I got in one little fight and my mom got scared, And said 'You're movin' with your auntie and uncle in Bel Air.'",
    style: TextStyle(color: Colors.white, fontSize: 22));
