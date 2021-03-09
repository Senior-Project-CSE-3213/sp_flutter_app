import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/models/event.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/services/database.dart';
import 'package:sp_flutter_app/shared/loading.dart';
import 'package:sp_flutter_app/viewmodels/user_viewmodel.dart';
import 'package:sp_flutter_app/views/user_profiles.dart';
import '../shared/constants.dart';
import '../shared/widgets/notification_drawer.dart';
import 'package:sp_flutter_app/views/wrapper.dart';

class EventDetailScreen extends StatefulWidget {
  EventDetailScreen({
    Key key,
  }) : super(key: key);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _subNavBar(BuildContext context) {
    return new Positioned(
      top: 10.0,
      left: 0.0,
      right: 0.0,
      height: 30,
      child: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor:
            mainColor.withOpacity(0), //You can make this transparent
        elevation: 0.0, //No shadow
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
    );
  }

  // _sendMessageArea(BuildContext context, Event event, User loggedUser) {
  //   return Container(
  //     child: ListTile(
  //         title: Container(
  //           height: 45,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(15)),
  //               //boxShadow: _boxShadow(new Offset(2, 2)),
  //               color: altSecondaryColor),
  //           padding: EdgeInsets.all(10),
  //           child: TextFormField(
  //             style: TextStyle(color: Colors.white),
  //             cursorColor: altPrimaryColor,
  //             decoration: InputDecoration.collapsed(
  //               hintText: "Send a question",
  //               hintStyle: TextStyle(color: Colors.white, fontSize: 20),
  //             ),
  //             textCapitalization: TextCapitalization.sentences,
  //           ),
  //         ),
  //         leading: ButtonTheme(
  //           minWidth: 95.0,
  //           height: 45.0,
  //           child: RaisedButton(
  //             child: Text("Sign Up", style: TextStyle(fontSize: 20)),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(15.0))),
  //             onPressed: () async {
  //               print('Clicked Sign Up button');
  //               await event.addParticipant(context, loggedUser);
  //             },
  //             color: altSecondaryColor,
  //             textColor: Colors.white,
  //             padding: EdgeInsets.all(8.0),
  //             splashColor: altPrimaryColor,
  //           ),
  //         ),
  //         trailing: IconButton(
  //           icon: Icon(Icons.send),
  //           onPressed: () {},
  //           iconSize: 30,
  //           color: altSecondaryColor,
  //         )),
  //   );
  // }

  _participantScrollView(bool showDecoration, List<User> participants) {
    return StreamProvider<List<User>>.value(
      value: DatabaseService().profiles,
      child: Container(
          height: 105,
          decoration: (showDecoration)
              ? new BoxDecoration(color: Colors.blueAccent[400])
              : null,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[];
              },
              body: SimpleUserDataList(
                  users: participants, direction: Axis.horizontal))),
    );
  }

  _boxShadow(Offset offset) {
    return [
      BoxShadow(
        color: Colors.black,
        offset: offset,
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ),
      BoxShadow(
        color: Colors.white,
        offset: const Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ),
    ];
  }

  _shadow(Offset offset) {
    return <Shadow>[
      Shadow(
        offset: offset,
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      Shadow(
        offset: offset,
        blurRadius: 8.0,
        color: Color.fromARGB(125, 0, 0, 255),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final EventArguments args = ModalRoute.of(context).settings.arguments;
    final _user = Provider.of<UserViewModel>(context).user;
    Event event = args.event;

    _sendMessageArea(BuildContext context, Event event, User loggedUser) {
      return Container(
        child: ListTile(
            title: Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  //boxShadow: _boxShadow(new Offset(2, 2)),
                  color: altSecondaryColor),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: altPrimaryColor,
                decoration: InputDecoration.collapsed(
                  hintText: "Send a question",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            leading: ButtonTheme(
              minWidth: 95.0,
              height: 45.0,
              child: RaisedButton(
                child: Text("Sign Up", style: TextStyle(fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                onPressed: () async {
                  print('Clicked Sign Up button');
                  await event
                      .addParticipant(context, loggedUser)
                      .then((value) => setState(() {}));
                },
                color: altSecondaryColor,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: altPrimaryColor,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
              iconSize: 30,
              color: altSecondaryColor,
            )),
      );
    }

    return StreamBuilder<List<User>>(
        stream: DatabaseService(uid: event.creator.uid, thisUser: event.creator)
            .profiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;
            List<User> participants = users
                .where((user) => event.participants.contains(user.uid))
                .toList();
            return SafeArea(
              child: Scaffold(
                  //bottomNavigationBar: _sendNavigationBar(),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endDocked,
                  key: _scaffoldKey,
                  endDrawer: NotificationDrawer(),
                  body: Stack(alignment: Alignment.center, children: <Widget>[
                    Container(
                      color: altPrimaryColor, // screen background color
                    ),
                    SizedBox(
                      width: 500,
                      height: 650,
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  event.eventName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
                                      shadows: _shadow(new Offset(5, 5))),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: altSecondaryColor,
                                      boxShadow: _boxShadow(new Offset(5, 5))),
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          print(
                                              "Clicked event creator profile");
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(20),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                  width: 2,
                                                  color: altPrimaryColor),
                                              boxShadow:
                                                  _boxShadow(new Offset(2, 2))),
                                          child: Icon(
                                            Icons.person,
                                            color: altPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Created by \n' +
                                            event.creator.username,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Starts \n' +
                                            new DateFormat(
                                                    "M-dd-yyyy \n@h:mm a'")
                                                .format(event.eventDate),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Spacer()
                                    ],
                                  )),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                  alignment: Alignment.center,
                                  // height: 180,
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 30, bottom: 20),
                                  child: Text(event.eventDescription,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22))),
                            ),
                            Flexible(
                              flex: 6,
                              child: Container(
                                  alignment: Alignment.center,
                                  //height: 180,
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          print("Clicked map");
                                        },
                                        child: Container(
                                          width: 200,
                                          height: 120,
                                          margin: EdgeInsets.all(20),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    'https://cdn.wccftech.com/wp-content/uploads/2017/03/Google-Maps.jpg',
                                                  ),
                                                  fit: BoxFit.fill),
                                              boxShadow:
                                                  _boxShadow(new Offset(5, 5))),
                                        ),
                                      ),
                                      Container(
                                        child: Flexible(
                                          child: Text(
                                            'X miles from you...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              child: Text(
                                'PARTICIPANTS',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            _participantScrollView(false, participants),
                          ])),
                    ),
                    _subNavBar(context),
                    new Container(
                        alignment: Alignment.bottomCenter,
                        child: _sendMessageArea(context, event, _user)),
                  ])),
            );
          } else {
            return Loading();
          }
        });
  }
}
