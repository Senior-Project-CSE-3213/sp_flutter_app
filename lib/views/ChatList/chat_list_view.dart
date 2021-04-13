import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/bottom_bar.dart';
import 'package:sp_flutter_app/shared/widgets/simple_text_input_field.dart';

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
                  if (val == 0) {
                    //main dm list page
                  } else if (val == 1) {
                    //profile view same as top left corner
                  } else if (val == 2) {
                    createChatDialog(context);
                  }
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
                              //TODO be able to click this to change status
                              CreateProfileCircle(
                                  "assets/profile_pictures/a_retired_legend.jpg",
                                  ""),
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
                                                  "2",
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
                            physics: BouncingScrollPhysics(),
                            children: <Widget>[
                              CreateChatCard(
                                  "assets/profile_pictures/chris_evans.jpg",
                                  "Chris Evans",
                                  "4:36PM",
                                  "Hey stan! Just checking to make sure that you're doing good",
                                  false,
                                  true),
                              CreateChatCard(
                                  "assets/profile_pictures/james_spader.jpg",
                                  "James Spader",
                                  "11:36PM",
                                  "Yo yo yo, you got that stuff I asked for?",
                                  false,
                                  false),
                              CreateChatCard(
                                  "assets/profile_pictures/kayleigh_mcenany.jpg",
                                  "Kayleigh Mcenany",
                                  "1:42AM",
                                  "Stan: have you gotten your speech ready for the awards night?",
                                  true,
                                  false),
                              CreateChatCard(
                                  "assets/profile_pictures/chris_pratt.jpg",
                                  "Chris Pratt",
                                  "7:01AM",
                                  "The brother's said they need you ASAP for your cameo; get down here now!",
                                  true,
                                  true),
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
        padding:
            const EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(45.0),
                    child: Container(
                        color: (_messageRead
                            ? Color.fromRGBO(42, 46, 55, 1)
                            : Color.fromRGBO(62, 66, 75, 1)),
                        height: 80,
                        width: 400,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CreateProfileCircle(_resourcePath, ""),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: (_contactOnline
                                        ? Colors.white
                                        : Color.fromRGBO(117, 127, 146, 1)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _nameLengthCheck(_name),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                      fontSize: 14),
                                ),
                                Text(
                                  _previewLengthCheck(_chatPreview),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        )))),
            Stack(
              children: [
                Container(
                  color: (_messageRead
                      ? Color.fromRGBO(42, 46, 55, 1)
                      : Color.fromRGBO(62, 66, 75, 1)),
                  height: 80,
                  width: 70,
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Text(
                    _timeLengthCheck(_timeSent),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _previewLengthCheck(String chatPreview) {
    return (chatPreview.length > 42
        ? chatPreview.substring(0, 39) + "..."
        : chatPreview);
  }

  String _nameLengthCheck(String name) {
    return (name.length > 30 ? name.substring(0, 27) + "..." : name);
  }

  String _timeLengthCheck(String time) {
    return (time.length > 7 ? time.substring(0, 7) : time);
  }
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

Future<void> _inform(BuildContext context, String title, String mainText,
    String secondaryText) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color.fromRGBO(30, 35, 41, 1),
        title: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                mainText,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                secondaryText,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Sounds good'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future createChatDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(25, 28, 35, 1),
            content: Container(
              child: Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create a group chat",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Group name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SimpleTextInputField(
                        error: false,
                        handleChange: (val) {},
                        handleSubmit: () {},
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            actions: [],
          );
        });
      });
}
