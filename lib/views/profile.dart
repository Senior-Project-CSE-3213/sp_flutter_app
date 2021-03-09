import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sp_flutter_app/models/event.dart';
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
    // The logged in user
    final _user = Provider.of<UserViewModel>(context).user;
    final ProfileArguments args = ModalRoute.of(context).settings.arguments;

    genericEvents(User owner) {
      List<Event> genericEvents = new List<Event>();
      var dates = new List<DateTime>();

      dates.add(DateTime.now());
      dates.add(DateTime.parse("2021-07-20 20:30:00"));
      dates.add(DateTime.parse("2021-04-15 14:15:00"));

      for (var i = 0; i < dates.length; i++) {
        genericEvents.add(new Event(
            creator: owner,
            eventName: owner.username + "'s New Event $i",
            eventDescription:
                "This is a new event $i from the legend " + owner.username,
            eventDate: dates[i]));
      }

      return genericEvents;
    }

    return StreamBuilder<User>(
        stream: DatabaseService(uid: _user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = args != null ? args.user : snapshot.data;
            print("User ID: " + user.uid);

            return StreamBuilder<List<Event>>(
                stream: DatabaseService(uid: user.uid, thisUser: user)
                    .userCreatedEvents,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Event> events = snapshot.data;
                    // Use operator to go to a detailed profile view for logged user and a simple one
                    // And separate this into a function
                    return Scaffold(
                        appBar: AppBar(
                          title: Text('Profile'),
                          backgroundColor: mainColor,
                        ),
                        body: SingleChildScrollView(
                          child: Center(
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  onPressed: () {
                                    print('Clicked create event button');
                                  },
                                  color: altSecondaryColor,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: altPrimaryColor,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  child: Text(
                                    'MY EVENTS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 500,
                                  height: 650,
                                  child: EventList(
                                    events: events,
                                    direction: Axis.vertical,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  } else {
                    return Loading();
                  }
                });
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
