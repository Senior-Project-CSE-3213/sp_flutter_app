import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/bottom_bar.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';

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

  void _openFilterDialog() async {
    await FilterListDialog.display(context,
        listData: countList,
        height: 380,
        borderRadius: 20,
        headlineText: "Select Filters",
        searchFieldHintText: "Search Here",
        selectedListData: selectedCountList, onApplyButtonClick: (list) {
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

    return ScaffoldWithGradient(
      bottomBar: true,
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                        bottom: kDefaultPadding,
                      ),
                      child: HeadingText(
                        text: "Sponsored Events",
                        scale: 0.5,
                        align: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 210,
                      child: ListView(
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
                            CreateSponsoredEventCard("Cowbell yell",
                                "Bettersworth Auditorium", "Sunday, 5:00PM"),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //latest event
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding,
                          ),
                          child: HeadingText(
                            text: "Latest Events",
                            scale: 0.5,
                            align: TextAlign.left,
                          ),
                        ),
                        Container(
                          //take away this
                          child: IconButton(
                            icon: Icon(Icons.filter_list),
                            color: Colors.white,
                            onPressed: _openFilterDialog,
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          CreateLatestEventCard("Intramural Football",
                              "Intramural Fields", "Friday, 6:30PM"),
                          CreateLatestEventCard("Dawgs After Dark", "The Hump",
                              "Thursday, 9:30PM"),
                          CreateLatestEventCard("Cowbell yell",
                              "Bettersworth Auditorium", "Sunday, 5:00PM"),
                          CreateLatestEventCard("Become an RA interest meeting",
                              "Taylor Auditorium", "Wednesday, 7:30PM"),
                          CreateLatestEventCard("Become an RA interest meeting",
                              "Taylor Auditorium", "Wednesday, 7:30PM"),
                          CreateLatestEventCard("Become an RA interest meeting",
                              "Taylor Auditorium", "Wednesday, 7:30PM"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
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
            width: 280,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(27, 109, 255, 1),
                  Color.fromRGBO(39, 82, 228, 1)
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
                        child: Text(
                          _titleLengthCheck(this.eventTitle),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.0,
                        child: Text(
                          _locationLengthCheck(this.eventLocation),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.playlist_add_check_sharp, //flutter icon
                          color: Colors.white,
                          size: 50),
                      SizedBox(
                        width: 80,
                      ),
                      SizedBox(
                        width: 100.0,
                        child: Text(
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
    return (eventTitle.length > 33
        ? eventTitle.substring(0, 30) + "..."
        : eventTitle);
  }

  String _locationLengthCheck(String eventLocation) {
    //
    return (eventLocation.length > 33
        ? eventLocation.substring(0, 30) + "..."
        : eventLocation);
  }

  String _timeLengthCheck(String eventTime) {
    return (eventTime.length > 20
        ? eventTime.substring(0, 17) + "..."
        : eventTime);
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
            width: 180,
            padding: const EdgeInsets.all(15),
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
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        _timeLengthCheck(this.eventTime),
                        style: TextStyle(
                          color: secondaryColor,
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
    return (eventTitle.length > 50
        ? eventTitle.substring(0, 47) + "..."
        : eventTitle);
  }

  String _locationLengthCheck(String eventLocation) {
    return (eventLocation.length > 23
        ? eventLocation.substring(0, 20) + "..."
        : eventLocation);
  }

  String _timeLengthCheck(String eventTime) {
    return (eventTime.length > 23
        ? eventTime.substring(0, 20) + "..."
        : eventTime);
  }
}
