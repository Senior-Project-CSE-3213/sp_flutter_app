import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//the bottom navigation bar widget
class BottomNavBar extends StatefulWidget {
  //data needed
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final int NBID;

  BottomNavBar(
      {this.defaultSelectedIndex,
      @required this.iconList,
      @required this.onChange,
      @required this.NBID});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex;
  int _previousIndex;
  // ignore: non_constant_identifier_names
  int _NBID;
  //0 means ELV, any other value is default unless you specify your ID and how you want the nav bar
  //laid out similar to how I did for the specifc case of the ELV
  List<IconData> _iconList = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _NBID = widget.NBID;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i, i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index, int previousIndex) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          //ELV
          if (_NBID == 0) {
            if (index != 0) {
              _selectedIndex = index;
            }
          } else if (_NBID == 1) {
            //indicates chat_list_view
            if (index != 2) {
              _selectedIndex = index;
            }
          }

          // you can also define your specific nav bar case stuff here
          //else if (_NBID == YOURID) {}

          //general
          else {
            _selectedIndex = index;
          }

          print("Switching to bottom_bar index $_selectedIndex");
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Container(
            height: 55,
            width: MediaQuery.of(context).size.width / _iconList.length,
            //ELV
            decoration: (_NBID == 0
                ? ((index == _selectedIndex && index != 0)
                    ? BoxDecoration(
                        color: Colors.amber[900],
                        gradient: new RadialGradient(
                            colors: [
                              Color.fromRGBO(213, 92, 5, 1),
                              Color.fromRGBO(25, 28, 35, 1)
                            ],
                            center: Alignment(0, 0.7),
                            radius: 0.12,
                            tileMode: TileMode.clamp,
                            stops: [0.3, 0.7]),
                      )
                    : BoxDecoration(color: Color.fromRGBO(25, 28, 35, 1)))
                //default decoration, you can specify your own like I did for ELV by adding more conditional statements here
                : (index == _selectedIndex
                    ? BoxDecoration(
                        color: Colors.amber[900],
                        gradient: new RadialGradient(
                            colors: [
                              Color.fromRGBO(213, 92, 5, 1),
                              _NBID == 0 ? Color.fromRGBO(25, 28, 35, 1) : Color.fromRGBO(30, 35, 41, 1) 
                            ],
                            center: Alignment(0, 0.7),
                            radius: 0.12,
                            tileMode: TileMode.clamp,
                            stops: [0.3, 0.7]),
                      )
                    : null)), //Color.fromRGBO(30, 35, 41, 1)
            //NOTE: these are not IconButtons so that we can have this indicator dot
            child: (_NBID == 0
                ?
                //ELV
                //if index is 2, we draw a custom icon
                (index == 2
                    ? Align(
                        child: SvgPicture.asset(
                            "assets/svgs/magnifying_glass.svg",
                            width: 26,
                            height: 26,
                            color: Colors.white),
                      )
                    //on index 0, we use a stack to make the purple plus and color it accordingly
                    : (index == 0
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                icon,
                                color: Color.fromRGBO(125, 62, 255, 1),
                                size: 38,
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 26,
                              ),
                            ],
                          )
                        //regular icon coloring
                        : Icon(
                            icon,
                            color: Colors.white,
                            size: 28,
                          )))

                //nbid of 1 is chat_list_view
                : (_NBID == 1
                    ? (index == 0
                        ? (Align(
                            child: SvgPicture.asset(
                                "assets/svgs/notification.svg",
                                width: 20,
                                height: 20,
                                color: Colors.white),
                          ))
                        : index == 1
                            ? (Align(
                                child: SvgPicture.asset(
                                    "assets/svgs/profile.svg",
                                    width: 20,
                                    height: 20,
                                    color: Colors.white),
                              ))
                            : Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    color: Color.fromRGBO(125, 62, 255, 1),
                                    size: 38,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ],
                              ))
                    //default icon drawing here
                    : Icon(
                        icon,
                        color: Colors.white,
                        size: 28,
                      )))),
      ),
    );
  }
}
