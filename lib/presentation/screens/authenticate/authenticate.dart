import 'package:flutter/material.dart';
import './components/body.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
