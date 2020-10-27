import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/screens/authenticate/authenticate.dart';
import 'package:sp_flutter_app/screens/home/home.dart';
import 'package:sp_flutter_app/services/auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    // return either Home or Authenticate widget or loading
    return StreamBuilder<User>(
      stream: auth.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return Authenticate();
          }
          return Home();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }
    );
  }
}
