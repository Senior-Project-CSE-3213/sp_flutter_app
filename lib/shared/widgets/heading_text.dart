import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key key,
    @required this.text,
    this.align,
  }) : super(key: key);

  final String text;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: 42,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
