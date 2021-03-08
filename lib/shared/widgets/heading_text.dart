import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
