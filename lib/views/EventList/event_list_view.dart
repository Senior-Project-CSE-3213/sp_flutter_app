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
            Icons.find_in_page,
            Icons.person,
            //todo find better images
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               //sponsored events row
               Row (
                  children: [
                    Container (
                      padding: const EdgeInsets.only(left: 40.0, top: 20),
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
                  //todo method for loading in json data and making cards

               ),
               //latest evnents and filter button
               Row(
                children: [
                  //latest event
                  Column (  
                    children: [
                      Container (
                        padding: const EdgeInsets.only(left: 40.0, top: 20),
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
                          onPressed: () {
                            //select filtering option
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
                   
                 ],
                  //todo make method for loading in json data and making cards
               ),
             ]
          )
        )
      )
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
