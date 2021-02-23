import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/shared/loading.dart';
import 'package:sp_flutter_app/shared/widgets/event_list.dart';
import 'package:sp_flutter_app/viewmodels/user_viewmodel.dart';
import '../shared/constants.dart';
import 'package:sp_flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/profile_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserViewModel>(context).user;
    final ProfileArguments args = ModalRoute.of(context).settings.arguments;

    return StreamBuilder<User>(
        stream: DatabaseService(uid: _user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = args != null ? args.user : snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Profile'),
                  backgroundColor: mainColor,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        user.username,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        user.phoneNumber,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      RaisedButton(
                        child: Text("Create Event",
                            style: TextStyle(fontSize: 20)),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        onPressed: () {
                          print('Clicked create event button');
                        },
                        color: altSecondaryColor,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        splashColor: altPrimaryColor,
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     EventList(
                      //       events: user.myEvents,
                      //       direction: Axis.vertical,
                      //     ),
                      //     EventList(
                      //       events: user.eventsSignedUpFor,
                      //       direction: Axis.vertical,
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ));
          } else {
            return Loading();
          }
        });
  }
}

class ProfileArguments {
  final User user;

  ProfileArguments({this.user});
}
