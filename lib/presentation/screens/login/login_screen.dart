import 'package:flutter/material.dart';
import 'package:sp_flutter_app/presentation/screens/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
