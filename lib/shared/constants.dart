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
const kDefaultPadding = 16.0;

const profileScreenRoute = '/screens/profile_screen.dart';
const settingScreenRoute = '/screens/settings_screen.dart';
const helpScreenRoute = '/screens/help_screen.dart';
const eventMapScreenRoute = '/screens/event_map.dart';
