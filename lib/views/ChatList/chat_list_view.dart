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
            backgroundColor: Color.fromRGBO(25, 28, 35, 1),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding,
                                  left: 2 * kDefaultPadding),
                              child: Text(
                                "Messages",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                    fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: kDefaultPadding,),
                              child: Container(
                                //take away this
                                child: IconButton(
                                  icon: Icon(Icons.view_headline),
                                  color: Colors.white,
                                  onPressed: null,
                                  iconSize: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))

                //messages label
                //circular search bar
                //new messages section
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
