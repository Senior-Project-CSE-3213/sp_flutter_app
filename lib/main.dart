import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sp_flutter_app/screens/event_map.dart';
import 'package:sp_flutter_app/screens/help_screen.dart';
import 'package:sp_flutter_app/screens/profile_screen.dart';
import 'package:sp_flutter_app/screens/settings_screen.dart';
import 'package:sp_flutter_app/screens/wrapper.dart';
import 'package:sp_flutter_app/shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(initialRoute: eventMapScreenRoute, routes: {
      eventMapScreenRoute: (_) => Wrapper(child: EventMap()),
      profileScreenRoute: (_) => ProfileScreen(),
      helpScreenRoute: (_) => HelpScreen(),
      settingScreenRoute: (_) => SettingScreen(),
    }),
  );
}
