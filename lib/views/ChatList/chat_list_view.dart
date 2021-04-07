import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/bottom_bar.dart';

class ChatListView extends StatefulWidget {
  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  //methods here
  //create new group method

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(30, 35, 41, 1),
            bottomNavigationBar: BottomNavBar(
              defaultSelectedIndex: 0,
              onChange: (val) {
                setState(() {
                  //val -> bottom bar in dex
                });
              },
              iconList: [
                Icons.plus_one,
                Icons.plus_one,
                Icons.plus_one,
              ],
              NBID: 1,
            ),
            body: Padding(
                padding: const EdgeInsets.only(
                    top: kDefaultPadding,
                    bottom: kDefaultPadding,
                    left: kDefaultPadding * 0.15,
                    right: kDefaultPadding * 0.15),
                child: Container(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: kDefaultPadding, left: kDefaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CreateProfileCircle(
                                  "assets/profile_pictures/a_retired_legend.jpg", "SL"),
                              Container(
                                child: Text(
                                  "Messages",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 18),
                                ),
                              ),
                              Container(
                                //take away this
                                child: IconButton(
                                  icon: Icon(Icons.view_headline),
                                  color: Colors.white,
                                  onPressed: () {
                                    //nothing right now
                                  },
                                  iconSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))

                //circular search bar
                //new messages section

                //section tabs within a scroll is something chase really wanted
                //today
                //yesterday
                //this week
                //last week

                //dribble:https://dribbble.com/shots/10907381--20-ChatApp-MobileApp-Concept
                //[rest of messages after spacer (don't label thsi one)]

                )));
  }
}

//extracted widget classes here
//full profile card widget
//preview profile card widget

// ignore: must_be_immutable
class CreateProfileCircle extends StatelessWidget {
  String _resourcePath;
  String _initials;

  CreateProfileCircle(String resourcePath, String initials) {
    _resourcePath = resourcePath;
    _initials = initials;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(213, 213, 213, 0),
            foregroundColor: Color.fromRGBO(30, 35, 41, 1),
            backgroundImage: AssetImage(_resourcePath),
            radius: 20,
            child: Text(
              _initials.length == 2 ? _initials.toUpperCase() : "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 18),
            ),
          )),
    );
  }
}
