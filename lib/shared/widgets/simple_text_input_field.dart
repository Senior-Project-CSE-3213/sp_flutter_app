import 'package:flutter/material.dart';

import '../constants.dart';

class SimpleTextInputField extends StatelessWidget {
  const SimpleTextInputField({
    Key key,
    @required this.error,
    this.obscure = false,
    this.handleSubmit,
    @required this.handleChange,
  }) : super(key: key);

  final bool error;
  final bool obscure;
  final void Function() handleSubmit;
  final void Function(String) handleChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      obscureText: obscure ? true : false,
      onSubmitted: (_) => handleSubmit,
      onChanged: handleChange,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: "Inter",
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: error ? Colors.red : secondaryColor,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: error ? Colors.red : secondaryColor,
            width: 2,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: error ? Colors.red : secondaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}