import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int _index;
  Function(int) _onChange;
  List<IconData> _iconList;

  int getIndex() {
    return this._index;
  }

  Function getOnChange() {
    return this._onChange;
  }

  List<IconData> getIconList() {
    return this._iconList;
  }

  BottomNavBar(int index, Function onChange, List<IconData> iconList) {
    this._index = index;
    this._onChange = onChange;
    this._iconList = iconList;
  }

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    
  }

  @override
  Widget build(BuildContext context) {
    
  }
}