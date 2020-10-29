import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/screens/help_screen.dart';
import 'package:sp_flutter_app/screens/profile_screen.dart';
import 'package:sp_flutter_app/screens/wrapper.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/shared/constants.dart';

import 'file:///E:/SeniorProject/sp_flutter_app/lib/screens/event_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(initialRoute: eventMapScreenRoute, routes: {
        eventMapScreenRoute: (_) => Wrapper(child: EventMap()),
        profileScreenRoute: (_) => Wrapper(child: ProfileScreen()),
        helpScreenRoute: (_) => Wrapper(child: HelpScreen()),
      })));
}
