import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sp_flutter_app/models/user.dart';
import '../shared/constants.dart';
import 'package:sp_flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/shared/widgets/profile_tile.dart';

class UserProfiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
      value: DatabaseService().profiles,
      child: Scaffold(
          appBar: AppBar(
            title: Text('All Profiles'),
            backgroundColor: primaryColor,
          ),
          body: SimpleUserDataList(direction: Axis.vertical)),
    );
  }
}

class SimpleUserDataList extends StatefulWidget {
  final Axis direction;
  final List<User> users;

  SimpleUserDataList({this.direction, this.users});

  @override
  _SimpleUserDataListState createState() => _SimpleUserDataListState();
}

class _SimpleUserDataListState extends State<SimpleUserDataList> {
  @override
  Widget build(BuildContext context) {
    final dataList = widget.users ?? Provider.of<List<User>>(context);

    return ListView.builder(
      scrollDirection: widget.direction,
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ProfileChip(profile: dataList[index]);
      },
    );
  }
}
