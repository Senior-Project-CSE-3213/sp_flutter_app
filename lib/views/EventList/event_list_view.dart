import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/bottom_bar.dart';

class EventListView extends StatefulWidget {
  @override
  _EventListViewState createState() => _EventListViewState();
}

//todo mimic drible more

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
              defaultSelectedIndex: 0,
              onChange: (val) {
                setState(() {
                  //we don't need to do anything right now
                });
              },
              iconList: [
                Icons.add_circle,
                Icons.home,
                Icons.find_in_page, 
                Icons.person,
              ],
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
                          height: 200,
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
            height: 160, 
            width:
                280, 
            padding: const EdgeInsets.all(
                15), 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(109, 135, 214, 1),
                  Color.fromRGBO(74, 194, 237, 1)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                    width: 200.0,
                    child: 
                      Text(
                        this.eventTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    )],
                ),

                SizedBox(
                  height: 5,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                    width: 200.0,
                    child: 
                      Text(
                        this.eventLocation,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    )],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   
                    Icon(Icons.playlist_add_check_sharp, //flutter icon
                        color: Colors.white, size: 50),
                       
                    SizedBox(width: 80,),
                    SizedBox(
                    width: 100.0,
                    child: 
                      Text(
                        this.eventTime,
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
              ],
            )),
      ),
    );
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
                      this.eventTitle,
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
                        this.eventLocation,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        this.eventTime,
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
}