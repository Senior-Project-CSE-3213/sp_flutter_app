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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: kDefaultPadding, left: kDefaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CreateProfileCircle(
                                  "assets/profile_pictures/a_retired_legend.jpg",
                                  "SL"),
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
                        Padding(
                          padding: const EdgeInsets.all(kDefaultPadding * 2.0),
                          child: Container(
                            height: 45,
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(60)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(60)),
                                  hintText: 'Search messages...',
                                  hintStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: kDefaultPadding * 2.0),
                              child: Container(
                                child: Text(
                                  "Contacts",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: kDefaultPadding * 2.0,
                              right: kDefaultPadding * 2.0,
                              top: kDefaultPadding),
                          child: Container(
                            height: 60,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                children: <Widget>[
                                  //create new one button here
                                  CreateContactCircle(),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/chris_hemsworth.jpg",
                                      "CH"),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/scarlet_johanson.jpg",
                                      "SJ"),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/samuel_jackson.jpg",
                                      "SJ"),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/robert_downey.jpg",
                                      "RD"),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/kayleigh_mcenany.jpg",
                                      "KM"),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/james_spader.jpg",
                                      "JS"),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/chris_pratt.jpg",
                                      "CP"),
                                  CreateProfileCircle(
                                      "assets/profile_pictures/chris_evans.jpg",
                                      "CE"),
                                ]),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: kDefaultPadding * 2.0,
                                  top: kDefaultPadding * 2.0),
                              child: Container(
                                child: Text(
                                  "Latest Chats",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: kDefaultPadding * 2.0,
                                      top: kDefaultPadding * 2.0),
                                  child: Container(
                                    child: Text(
                                      "Unread messages",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(226, 98, 98, 1),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: kDefaultPadding * 2.0),
                                  child: Container(
                                    child: Flexible(
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          226, 98, 98, 1),
                                                ),
                                                Text(
                                                  "9+",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          30, 35, 41, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 8),
                                                ),
                                              ])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              // CreateChatCard(
                              //     "path/to/image",
                              //     "contact name",
                              //     "12:30",
                              //     "Hey stan! Just checking to make sure that you're",
                              //     false,
                              //     true),
                            ],
                          ),
                        )
                      ],
                    )))));
  }
}

// ignore: must_be_immutable
class CreateChatCard extends StatelessWidget {
  String _resourcePath;
  String _name;
  String _timeSent;
  String _chatPreview;
  bool _messageRead;
  bool _contactOnline;

  CreateChatCard(String resourcePath, String name, String timeSent,
      String chatPreview, bool messageRead, bool contactOnline) {
    _resourcePath = resourcePath;
    _name = name;
    _timeSent = timeSent;
    _chatPreview = chatPreview;
    _messageRead = messageRead;
    _contactOnline = contactOnline;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
        child: Container(
          child: Text(_name),
          //main card that's gray shade depending on seen
          //row of 3 elements: stack to make profile view with indicator dot, column for row of text, column for time shifted up
        ),
      ),
    );
  }

  //trim name if too long
  //trim chat preview if too long
}

class CreateContactCircle extends StatelessWidget {
  CreateContactCircle();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Stack(alignment: AlignmentDirectional.center, children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: Color.fromRGBO(30, 35, 41, 1),
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 26,
            ),
          ])),
    );
  }
}

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
