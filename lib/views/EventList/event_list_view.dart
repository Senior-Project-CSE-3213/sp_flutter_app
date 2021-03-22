import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/CustomShowDialog.dart';
import 'package:sp_flutter_app/shared/widgets/bottom_bar.dart';

//dribble designs for message view
//https://cdn.dribbble.com/users/6947512/screenshots/15056404/media/772ef5df92a45895db6deea19148d3be.png?compress=1&resize=1200x900

class EventListView extends StatefulWidget {
  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  List<String> countList = [
    "Alphabetical",
    "Newest",
    "Oldest",
    "Soonest",
    "Latest"
  ];
  List<String> selectedCountList = [];

  // ignore: missing_return
  Future<List<String>> _createEventPopup(BuildContext context) async {
    //we should replace fields and buttons with Justin's widgets
    TextEditingController titleField = new TextEditingController();
    TextEditingController locationField = new TextEditingController();
    
    

    showDialog(context: context, builder: (BuildContext context) {
      DateTime pickedStartDate = DateTime.now();
      TimeOfDay pickedStartTime = TimeOfDay.now();
      DateTime pickedEndDate = DateTime.now();
      TimeOfDay pickedEndTime = TimeOfDay.now();

      return CustomAlertDialog(
        content: Container (
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 2.5,
          color: Color.fromRGBO(40, 47, 67, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //todo put close x button in right corner

              TextField(
                controller: titleField,
                decoration: new InputDecoration(
                  hintText: "Enter your event title",
                  labelText: "Event Title",
                  labelStyle: new TextStyle(
                    color: Color.fromRGBO(255,255,255,1),
                    fontWeight: FontWeight.bold,
                  ),
                  border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blue
                    )
                  )
                ),
              ),
              TextField(
                controller: locationField,
                decoration: new InputDecoration(
                  hintText: "Enter your event location",
                  labelText: "Event Location",
                  labelStyle: new TextStyle(
                    color: Color.fromRGBO(255,255,255,1),
                    fontWeight: FontWeight.bold,
                  ),
                  border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blue
                    )
                  )
                ),
              ),
              
              //event time label
              //event date range picker

              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  //todo sort out this and then copy for end date
                  // then just format and style the UI more
                  ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10,12,10,12),
                        child: Text(
                          "Select Start",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            color:  Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromRGBO(25, 28, 35, 1),)
                        )
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        // ignore: missing_return
                        (Set<MaterialState> states) {
                          return Color.fromRGBO(125,62,255,1); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () async {
                      DateTime date = await showDatePicker (
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                        initialDate: pickedStartDate,
                        initialEntryMode: DatePickerEntryMode.input,
                        helpText: "Select start date",
                        cancelText: "Cancel",
                        confirmText: "OK",
                        fieldLabelText: "Event start date",
                        fieldHintText: "Month/Date/Year",
                        errorFormatText: "That's not a valid date :/",
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark(), // This will change to light theme.
                            child: child,
                          );
                        },
                      );

                      if (date != null) {
                        setState() {
                          pickedStartDate = date;
                        }
                      }

                      TimeOfDay time = await showTimePicker(
                        context: context,
                        initialTime: pickedStartTime,
                        helpText: "Select start time",
                        cancelText: "Cancel",
                        confirmText: "OK",
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark(), // This will change to light theme.
                            child: child,
                          );
                        },
                      );

                      if (time != null) {
                        setState() {
                          pickedStartTime = time;
                        }
                      }
                    },
                  ),

                  ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10,12,10,12),
                        child: Text(
                          "Select End",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            color:  Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromRGBO(25, 28, 35, 1),)
                        )
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        // ignore: missing_return
                        (Set<MaterialState> states) {
                          return Color.fromRGBO(125,62,255,1); // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () async {
                      DateTime date = await showDatePicker (
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                        initialDate: pickedStartDate,
                        initialEntryMode: DatePickerEntryMode.input,
                        helpText: "Select end date",
                        cancelText: "Cancel",
                        confirmText: "OK",
                        fieldLabelText: "Event end date",
                        fieldHintText: "Month/Date/Year",
                        errorFormatText: "That's not a valid date :/",
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark(), // This will change to light theme.
                            child: child,
                          );
                        },
                      );

                      if (date != null) {
                        setState() {
                          pickedEndDate = date;
                        }
                      }

                      TimeOfDay time = await showTimePicker(
                        context: context,
                        initialTime: pickedStartTime,
                        helpText: "Select end time",
                        cancelText: "Cancel",
                        confirmText: "OK",
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark(), // This will change to light theme.
                            child: child,
                          );
                        },
                      );

                      if (time != null) {
                        setState() {
                          pickedEndTime = time;
                        }
                      }
                    },
                  ),
                ],
              ),

              ListTile(
                title: Text(
                  //tod this needs to update
                    "Start: ${pickedStartDate.month}/${pickedStartDate.day}/${pickedStartDate.year} ${pickedStartTime.hour}:${pickedStartTime.minute}" 
                    + "\nEnd: ${pickedEndDate.month}/${pickedEndDate.day}/${pickedEndDate.year} ${pickedEndTime.hour}:${pickedEndTime.minute}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color:  Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),

      
              ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10,12,10,12),
                  child: Text(
                    "Create Event",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color:  Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(25, 28, 35, 1),)
                  )
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  // ignore: missing_return
                  (Set<MaterialState> states) {
                    return Color.fromRGBO(125,62,255,1); // Use the component's default.
                  },
                ),
              ),
              onPressed: () {
                //todo add the date to this list
                Navigator.of(context).pop([titleField.text.toString(), locationField.text.toString(),]);
              },
            ),
          ]),
        ),
      );
    });
  }

  void _openFilterDialog() async {
    await FilterListDialog.display(context,
        allTextList: countList,
        height: 380,
        borderRadius: 20,
        headlineText: "Select Filters",
        searchFieldHintText: "Search Here",
        selectedTextList: selectedCountList, onApplyButtonClick: (list) {
      if (list != null) {
        setState(() {
          selectedCountList = List.from(list);
        });
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(25, 28, 35, 1),
            bottomNavigationBar: BottomNavBar(
              defaultSelectedIndex: 1,
              onChange: (val) {
                setState(() {
                  if (val == 0) {
                    _createEventPopup(context).then((eventDetails) {
                      //DO STUFF HERE SAM
                    });
                  }
                });
              },
              iconList: [
                Icons.add_circle,
                Icons.home,
                Icons.find_in_page, 
                Icons.person,
              ],
              NBID: 0,
            ),

            body: Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding,
                                             left: kDefaultPadding * 0.15, right: kDefaultPadding * 0.15),
              child: Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: kDefaultPadding, left: 2 * kDefaultPadding),
                              child: Text(
                                "Sponsored Events",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),

                        //todo colors and gradients for cards
                        //todo different fonts and icons
                        //make sure that if there's too much text it just fades to ...
                        Container(
                          height: 210,
                          child: ListView (
                             scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    CreateSponsoredEventCard(
                                        "Become an RA interest meeting",
                                        "Taylor Auditorium",
                                        "Wednesday, 7:30PM"),

                                    CreateSponsoredEventCard("Intramural Football",
                                        "Intramural Fields", "Friday, 6:30PM"),
                                    
                                    CreateSponsoredEventCard("Dawgs After Dark",
                                        "The Hump", "Thursday, 9:30PM"),
                                     
                                  CreateSponsoredEventCard( 
                                        "Cowbell yell",
                                        "Bettersworth Auditorium",
                                        "Sunday, 5:00PM"),
                                    
                                  ]
                          ),
                        ),

                        Padding (
                          padding: const EdgeInsets.only(bottom: kDefaultPadding, top: kDefaultPadding, 
                          left: kDefaultPadding * 2, right: kDefaultPadding * 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //latest event
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      "Latest Events",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              
                              Column(
                                children: <Widget>[
                                  Container(
                                    //take away this
                                    child: IconButton(
                                      icon: Icon(Icons.view_headline),
                                      color: Colors.white,
                                      onPressed: _openFilterDialog,
                                      iconSize: 30,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Filter",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded (
                          child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: <Widget>[
                                    CreateLatestEventCard("Intramural Football",
                                        "Intramural Fields", "Friday, 6:30PM"),
                                    
                                    CreateLatestEventCard("Dawgs After Dark",
                                        "The Hump", "Thursday, 9:30PM"),
                                     
                                    CreateLatestEventCard(
                                        "Cowbell yell",
                                        "Bettersworth Auditorium",
                                        "Sunday, 5:00PM"),
                                    
                                    CreateLatestEventCard(
                                        "Become an RA interest meeting",
                                        "Taylor Auditorium",
                                        "Wednesday, 7:30PM"),
                                  ],
                                )
                        )
                      ])),
            )));
  }
}

// ignore: must_be_immutable
class CreateSponsoredEventCard extends StatelessWidget {
  String eventTitle;
  String eventLocation;
  String eventTime;

  CreateSponsoredEventCard(String title, String location, String time) {
    eventTitle = title;
    eventLocation = location;
    eventTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 210, 
            width:
                280, 
            padding: const EdgeInsets.all(
                15), 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(27,109,255, 1),
                  Color.fromRGBO(39,82,228, 1)
                ], //or 16,60,98 to 37,139,191
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            child: Column(
              //column holds all text on container
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //this starts the children of the card
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                      width: 200.0,
                      child: 
                        Text(
                          _titleLengthCheck(this.eventTitle),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      )],
                  ),
                ),

                Container (
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                      width: 200.0,
                      child: 
                        Text(
                          _locationLengthCheck(this.eventLocation),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      )],
                  ),
                ),

                Container (
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                     
                      Icon(Icons.playlist_add_check_sharp, //flutter icon
                          color: Colors.white, size: 50),
                         
                      SizedBox(width: 80,),
                      SizedBox(
                      width: 100.0,
                      child: 
                        Text(
                          _timeLengthCheck(this.eventTime),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  String _titleLengthCheck(String eventTitle) {
    return (eventTitle.length > 33 ? eventTitle.substring(0,30) + "..." : eventTitle);
  }

  String _locationLengthCheck(String eventLocation) { //
    return (eventLocation.length > 33 ? eventLocation.substring(0,30) + "..." : eventLocation);
  }

  String _timeLengthCheck(String eventTime) {
    return (eventTime.length > 20 ? eventTime.substring(0,17) + "..." : eventTime);
  }
}

// ignore: must_be_immutable
class CreateLatestEventCard extends StatelessWidget {
  String eventTitle;
  String eventLocation;
  String eventTime;

  CreateLatestEventCard(String title, String location, String time) {
    eventTitle = title;
    eventLocation = location;
    eventTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 80, 
            width:
                180, 
            padding: const EdgeInsets.all(
                15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(40, 47, 67, 1),
                  Color.fromRGBO(40, 47, 67, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Column(
              //column holds all text on container
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      _titleLengthCheck(this.eventTitle),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),

                SizedBox(
                  height: 2,
                ), //spacer

                Expanded(
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _locationLengthCheck(this.eventLocation),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        _timeLengthCheck(this.eventTime),
                        style: TextStyle(
                          color: Color.fromRGBO(203, 115, 239, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  )),
                ),
              ],
            )),
      ),
    );
  }

  String _titleLengthCheck(String eventTitle) {
    return (eventTitle.length > 50 ? eventTitle.substring(0,47) + "..." : eventTitle);
  }

  String _locationLengthCheck(String eventLocation) {
    return (eventLocation.length > 23 ? eventLocation.substring(0,20) + "..." : eventLocation);
  }

  String _timeLengthCheck(String eventTime) {
    return (eventTime.length > 23 ? eventTime.substring(0,20) + "..." : eventTime);
  }
}
