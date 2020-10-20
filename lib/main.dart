import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/data/models/user.dart';
import 'package:sp_flutter_app/presentation/screens/wrapper.dart';
import 'package:sp_flutter_app/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StreamProvider<User>(
      create: (_) => AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    ),
  );
}
