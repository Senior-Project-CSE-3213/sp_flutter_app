import 'package:flutter/material.dart';

import '../constants.dart';

class SimpleInputLabel extends StatelessWidget {
  const SimpleInputLabel({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding * 2.0,
        bottom: kDefaultPadding,
      ),
      child: Text(
        "$text".toUpperCase(),
        style: TextStyle(
          color: Color(0xffadadb2),
          fontSize: 14,
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          letterSpacing: 0.50,
        ),
      ),
    );
  }
}
