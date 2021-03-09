import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/widgets/flutter_stateful_dialog.dart';

// Future<bool> confirmationAlert(
//     BuildContext context, String title, String message) async {
//   bool result = false;
//   bool chosen = false;
//   var actions = <Widget>[
//     FlatButton(
//       child: Text("YES"),
//       onPressed: () {
//         Navigator.of(context).pop();
//         result = true;
//         chosen = true;
//         //return true;
//       },
//     ),
//     FlatButton(
//       child: Text("NO"),
//       onPressed: () {
//         Navigator.of(context).pop();
//         result = false;
//         chosen = true;
//         //return true;
//       },
//     ),
//   ];
//   AlertDialogArgs args = new AlertDialogArgs(
//       title: title, content: Text(message), actions: actions);

//   alertDialog(context, args);
//   while (chosen != true) Future.delayed(Duration(milliseconds: 1));

//   return result;
// }
