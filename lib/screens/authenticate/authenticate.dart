import 'package:flutter/material.dart';
import 'package:sp_flutter_app/screens/authenticate/register.dart';
import 'package:sp_flutter_app/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Container(
        child: SignIn(toggleView: toggleView),
      );
    } else
      return Container(
        child: Register(toggleView: toggleView),
      );
  }
}
