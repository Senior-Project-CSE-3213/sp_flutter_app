import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sp_flutter_app/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService())
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    ),
  );
}
