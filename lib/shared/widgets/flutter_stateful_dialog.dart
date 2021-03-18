import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/constants.dart';

alertDialog(BuildContext context, AlertDialogArgs args) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(args.title ?? "Alert!",
            textAlign: TextAlign.center,
            style: TextStyle(color: labelTextColor)),
        content: args.content ?? null,
        actions: args.actions ?? null,
        elevation: 5,
        backgroundColor: primaryColor,
      );
    },
  );
}

class AlertDialogArgs {
  String title;
  Widget content;
  List<Widget> actions;

  AlertDialogArgs({this.title, this.content, this.actions});
}
