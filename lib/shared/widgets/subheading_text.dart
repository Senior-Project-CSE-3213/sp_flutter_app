import 'package:flutter/material.dart';

class SubHeadingText extends StatelessWidget {
  const SubHeadingText({
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
        fontSize: 20,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
