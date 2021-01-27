import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class EventListView extends StatefulWidget {
  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea (
      child: Scaffold (
        bottomNavigationBar: BottomNavigationBar (
          iconList: [
            Icons.add_circle,
            Icons.home,
            Icons.find_in_page, //this one is irrelevant
            Icons.person,
          ],
          
          onChange: (val) {
            setState(() {
              //we don't need to do anything right now
            });
          },
          defaultSelectedIndex: 0,
        ),

        //now we can do all the view stuff here in the body
        body: Container (
          height: size.height,
          child: Column (
            mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               //sponsored events row
               Row (
                  children: [
                    Container (
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: 
                      Text ( 
                          "Sponsored Events",
                          style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  ],
               ),
               // card view row 
               Row (
                 children: [
                   Padding(
                    padding: const EdgeInsets.only(top: 10),
                     child: Container (
                       height: 160,
                       width: size.width,

                      //I'm going to look at this: 
                      //https://www.youtube.com/watch?v=neXfa4J752A&ab_channel=CodeX
                      // to make it have indicator dots and maybe stackable
                       child: ListView (
                         scrollDirection: Axis.horizontal,
                         children: <Widget>[
                            CreateSponsoredEventCard("Intramural Football",
                            "Intramural Fields","Friday, 6:30PM"),
                            CreateSponsoredEventCard("Dawgs After Dark",
                            "The Hump","Thursday, 9:30PM"),
                            CreateSponsoredEventCard("Cowbell yell",
                            "Bettersworth Auditorium","Sunday, 5:00PM"),
                            CreateSponsoredEventCard("Become an RA interest meeting",
                            "Taylor Auditorium","Wednesday, 7:30PM"),
                         ],
                       ) 
                     ),
                   )
                 ],
               ),
               //latest evnents and filter button
               Row(
                children: [
                  //latest event
                  Column (  
                    children: [
                      Container (
                        padding: const EdgeInsets.only(left: 20.0,),
                        child: 
                        Text ( 
                            "Latest Events",
                            style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  ),

                  //filter button
                  Column (
                    children: <Widget>[
                      Container (
                        padding: const EdgeInsets.only(left: 180.0, top: 20),
                        child: 
                        IconButton (
                          icon: Icon(Icons.view_headline),
                          color: Colors.black,
                          tooltip: "Filter lastest events by...",
                          onPressed: () {
                            //select filtering option
                            print("Filter latest events button pressed");
                          },
                          iconSize: 30,
                        ),
                      ),

                      Container (
                        padding: const EdgeInsets.only(left: 180.0, top: 0),
                        child: 
                        Text ( 
                            "Filter",
                            style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
               ),
               //scrollable row for latest event cards
               Row(
                 children: [
                   Padding(
                    padding: const EdgeInsets.only(top: 10),
                     child: Container (
                       height: 307,
                       width: size.width,

                       child: ListView (
                         scrollDirection: Axis.vertical,
                         children: <Widget>[
                            CreateLatestEventCard("Intramural Football",
                            "Intramural Fields","Friday, 6:30PM"),
                            CreateLatestEventCard("Dawgs After Dark",
                            "The Hump","Thursday, 9:30PM"),
                            CreateLatestEventCard("Cowbell yell",
                            "Bettersworth Auditorium","Sunday, 5:00PM"),
                            CreateLatestEventCard("Become an RA interest meeting",
                            "Taylor Auditorium","Wednesday, 7:30PM"),
                         ],
                       ) 
                     ),
                   )
                 ],
               ),
             ]
          )
        )
      )
    );
  }
}

// ignore: must_be_immutable
class CreateSponsoredEventCard extends StatelessWidget {
  String _eventTitle;
  String _eventLocation;
  String _eventTime;

  CreateSponsoredEventCard(String title, String location, String time) {
    _eventTitle = title;
    _eventLocation = location;
    _eventTime = time;
  }

  String getEventTitle() {
    return this._eventTitle;
  }

  String getEventLocation() {
    return this._eventLocation;
  }

  String getEventTime() {
    return this._eventTime;
  }

  void setEventTitle(String title) {
    this._eventTitle = title;
  }

  void setEventLocation(String location) {
    this._eventLocation = location;
  }

  void setEventTime(String time) {
    this._eventTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible (
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container (
          height: 140, //height should remain same
          width: 180, //width could possible stretch, make a min and max for this?
          padding: const EdgeInsets.all(15), //this is padding for text inside the card
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
                Colors.blue.shade700, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade700.withOpacity(0.4), blurRadius: 4, spreadRadius: 2
              )
            ]
          ),
          child: Column ( //column holds all text on container
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ //this starts the children of the card
              Expanded(
                child: Container (
                  child: Text(
                    this._eventTitle, style: TextStyle( //event title at top
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),

              SizedBox(height: 2,), //spacer

              Expanded(
                child: Container (
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this._eventLocation, style: TextStyle( //event loc in middle
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),

                      SizedBox(height: 2,),

                      Text(
                        this._eventTime, style: TextStyle( //event loc in middle
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  )
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CreateLatestEventCard extends StatelessWidget {
  String _eventTitle;
  String _eventLocation;
  String _eventTime;

  CreateLatestEventCard(String title, String location, String time) {
    _eventTitle = title;
    _eventLocation = location;
    _eventTime = time;
  }

  String getEventTitle() {
    return this._eventTitle;
  }

  String getEventLocation() {
    return this._eventLocation;
  }

  String getEventTime() {
    return this._eventTime;
  }

  void setEventTitle(String title) {
    this._eventTitle = title;
  }

  void setEventLocation(String location) {
    this._eventLocation = location;
  }

  void setEventTime(String time) {
    this._eventTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible (
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container (
          height: 100, //height should remain same
          width: 180, //width could possible stretch, make a min and max for this?
          padding: const EdgeInsets.all(15), //this is padding for text inside the card
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
                Colors.deepOrangeAccent, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.shade100.withOpacity(0.4), blurRadius: 4, spreadRadius: 2
              )
            ]
          ),
          child: Column ( //column holds all text on container
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ //this starts the children of the card
              Expanded(
                child: Container (
                  child: Text(
                    this._eventTitle, style: TextStyle( //event title at top
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),

              SizedBox(height: 2,), //spacer

              Expanded(
                child: Container (
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        this._eventLocation, style: TextStyle( //event loc in middle
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),

                      Text(
                        this._eventTime, style: TextStyle( //event loc in middle
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  )
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

//the bottom navigation bar widget
class BottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList; //this is just the rep icons

  BottomNavigationBar ({
      this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange
  });

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = []; //go away

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      //adding icons to bottom nav bar, refactoring here still
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector (
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
          print("Switching to bottom nav index $_selectedIndex");
        });
      },

      child: Container (
        height: 50,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex ? BoxDecoration (
          color: Colors.amber[900],
          gradient: new RadialGradient(
            colors: [Colors.amber[900], Colors.blueGrey[900]],
          center: Alignment(0, 0.7),
          radius: 0.12,
          tileMode: TileMode.clamp,
          stops: [0.3,0.7]
          ),
        ) : BoxDecoration (
          border: Border (
            bottom: BorderSide(width: 4, color: Colors.blueGrey[900]),
          ),

          color: Colors.blueGrey[900]),
          //NOTE: these are not IconButtons so that we can have this indicator dot
        child: (index == 2 ? Align(
          child: SvgPicture.asset (
              "assets/svgs/magnifying_glass.svg",
              width: 26,
              height: 26,
              color: Colors.white
          ),
        ) : Icon (
            icon,
            color: Colors.white,
            size: 28,
        ))
      ),
    );
  }
}
