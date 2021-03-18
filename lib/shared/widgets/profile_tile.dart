import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/views/profile.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class ProfileChip extends StatelessWidget {
  final User profile;

  ProfileChip({this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: ChoiceChip(
          selected: false,
          onSelected: (bool selected) {
            Navigator.pushNamed(context, profileScreenRoute,
                arguments: ProfileArguments(user: profile));
          },
          backgroundColor: secondaryColor,
          avatar: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Icon(Icons.person)),
          label: Text(
            profile.username,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          labelPadding:
              EdgeInsets.only(left: 10, right: 20, bottom: 30, top: 30),
        ));
  }
}
