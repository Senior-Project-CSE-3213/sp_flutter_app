import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Center(
          child: SpinKitWave(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
