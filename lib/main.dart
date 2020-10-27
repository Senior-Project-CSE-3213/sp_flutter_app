import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/screens/authenticate/authenticate.dart';
import 'package:sp_flutter_app/screens/home/home.dart';
import 'package:sp_flutter_app/screens/wrapper.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/widgets/event_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
          home: Authenticate(),
          routes: {
            '/event_map': (_) => Wrapper(child: EventMap()),
          }
      )
    )
  );
}
