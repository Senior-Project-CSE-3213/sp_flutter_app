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

const Color primaryColor = Color(0xFF191A21);
const Color secondaryColor = Color(0xFF7B61FF);
const Color blueColor = Color(0xFF246BFD);
const Color primaryLightColor = Color(0xFFDEDEDE);
const Color labelTextColor = Color(0xffadadb2);

const String onboardingViewRoute = '/views/onboarding/onboarding.dart';
const String usingEmailViewRoute = '/views/authentication/sign_in_email.dart';
const String registerViewRoute = '/views/authentication/register.dart';
const String createProfileViewRoute =
    '/views/authentication/create_profile.dart';
const String signInViewRoute = '/views/authentication/sign_in.dart';
const String profileViewRoute = '/views/profile/profile.dart';
const String settingViewRoute = '/views/settings/settings.dart';
const String helpViewRoute = '/views/help/help.dart';
const String mapViewRoute = '/views/map/map.dart';
