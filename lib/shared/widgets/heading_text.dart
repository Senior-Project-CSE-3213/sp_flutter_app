import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key key,
    @required this.text,
    this.align,
    this.scale,
  }) : super(key: key);

  final String text;
  final TextAlign align;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: scale != null ? 48 * scale : 48,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
