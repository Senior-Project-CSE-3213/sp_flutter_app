import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sp_flutter_app/shared/widgets/bottom_bar.dart';

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
                Icons.find_in_page, //this one is irrelevant
                Icons.person,
              ],
            ),

            //now we can do all the view stuff here in the body
            body: Container (
          height: size.height,
          width: size.width,
          child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              SizedBox(height: 20,),
               
               //sponsored events row
               Row (
                  children: [
                    Container (
                      padding: const EdgeInsets.only(left: 40.0),
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
                      Container (
                       height: size.height / 4,
                       width: size.width,

                       child:
                          Container(
                            height: size.height / 4,
                            child: Swiper(

                              autoplay: true,
                              itemCount: 6, //make dynamic based on number of jsons parsed
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: 
                                  
                                  //todo based on width, make a card from a json index
                                  CreateSponsoredEventCard("Become an RA interest meeting", 
                                  "Taylor Auditorium","Wednesday, 7:30PM"),
                                  
                                );
                              },     
                              pagination: new SwiperPagination(
                                margin: new EdgeInsets.all(20.0), 
                                builder: new DotSwiperPaginationBuilder(
                                   color: Colors.white, activeColor: Colors.blue),
                              ),
                              viewportFraction: 0.9,
                              scale: 0.9,
                            ),
                          )
                     ), 
                 ],
               ),

               //latest evnents and filter button
               Padding(
                 padding: const EdgeInsets.only(left:40,right:20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [    
                    
                    //latest event
                    Column (  
                      children: [
                        SizedBox(height: 10,),
                        Container (
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
                        
                        Container ( //take away this
                          child: 
                          IconButton (
                            icon: Icon(Icons.view_headline),
                            color: Colors.black,
                            tooltip: "Filter lastest events by...",
                            onPressed:  _openFilterDialog,
                            iconSize: 30,
                          ),
                        ),

                        Container (
                          child: 
                          Text ( 
                              "Filter",
                              style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                 ),
               ),
               //scrollable row for latest event cards
               Row(
                 children: [ 
                      Container (
                       height: size.height / 3, //use up reste of space
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
            height: 160, //height should remain same
            width:
                220, //width could possible stretch, make a min and max for this?
            padding: const EdgeInsets.all(
                15), //this is padding for text inside the card
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.shade700.withOpacity(0.4),
                      blurRadius: 4,
                      spreadRadius: 2)
                ]),
            child: Column(
              //column holds all text on container
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //this starts the children of the card
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        this.eventTitle,
                        style: TextStyle(
                          //event loc in middle
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 5,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        this.eventLocation,
                        style: TextStyle(
                          //event loc in middle
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        this.eventTime,
                        style: TextStyle(
                          //event loc in middle
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
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
            height: 80, //height should remain same
            width:
                180, //width could possible stretch, make a min and max for this?
            padding: const EdgeInsets.all(
                15), //this is padding for text inside the card
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(14)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.orange.shade100.withOpacity(0.4),
                      blurRadius: 4,
                      spreadRadius: 2)
                ]),
            child: Column(
              //column holds all text on container
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //this starts the children of the card
                Expanded(
                  child: Container(
                    child: Text(
                      this.eventTitle,
                      style: TextStyle(
                        //event title at top
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
                          //event loc in middle
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        this.eventTime,
                        style: TextStyle(
                          //event loc in middle
                          color: Colors.white,
                          fontSize: 14,
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
