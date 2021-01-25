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

const Color kPrimaryColor = Color(0xFF191A21);
const Color kSecondaryColor = Color(0xFF7B61FF);
const Color kBlueColor = Color(0xFF246BFD);
const Color kPrimaryLightColor = Color(0xFFDEDEDE);

const String onboardingViewRoute = '/views/onboarding/onboarding.dart';
const String signInEmailViewRoute = '/views/authentication/sign_in_email.dart';
const String registerViewRoute = '/views/authentication/register.dart';
const String signInViewRoute = '/views/authentication/sign_in.dart';
const String profileViewRoute = '/views/profile/profile.dart';
const String settingViewRoute = '/views/settings/settings.dart';
const String helpViewRoute = '/views/help/help.dart';
const String mapViewRoute = '/views/map/map.dart';
