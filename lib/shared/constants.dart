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

const double kDefaultPadding = 16.0;

const primaryColor = Color(0xFF191A21);

const blueColor = Color(0xFF246BFD);
const secondaryColor = Color(0xFF7B61FF);
const primaryLightColor = Color(0xFFDEDEDE);
const labelTextColor = Color(0xffadadb2);

const profileScreenRoute = '/screens/profile_screen.dart';
const settingScreenRoute = '/screens/settings_screen.dart';
const helpScreenRoute = '/screens/help_screen.dart';
const eventMapScreenRoute = '/screens/event_map.dart';
const eventDetailScreenRoute = '/screens/event_detail_view.dart';
const allUserProfilesScreenRoute = '/screens/user_profiles.dart';
