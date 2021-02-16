import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/shared/constants.dart';

//the bottom navigation bar widget
class BottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList; //this is just the rep icons

  BottomNavBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
          print("Switching to bottom nav index $_selectedIndex");
        });
      },
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width / _iconList.length,
          decoration: index == _selectedIndex
              ? BoxDecoration(
                  color: Colors.amber[900],
                  gradient: new RadialGradient(
                      colors: [Colors.white, mainColor],
                      center: Alignment(0, 0.7),
                      radius: 0.12,
                      tileMode: TileMode.clamp,
                      stops: [0.3, 0.7]),
                )
              : BoxDecoration(color: mainColor),
          //NOTE: these are not IconButtons so that we can have this indicator dot
          child: (index == 2
              ? Align(
                  child: SvgPicture.asset("assets/svgs/magnifying_glass.svg",
                      width: 26, height: 26, color: Colors.white),
                )
              : Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ))),
    );
  }
}
