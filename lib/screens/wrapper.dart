import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/models/user.dart';
import 'package:sp_flutter_app/screens/authenticate/authenticate.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/main_drawer.dart';
import 'package:sp_flutter_app/shared/widgets/notification_drawer.dart';
import 'package:sp_flutter_app/viewmodels/user_viewmodel.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Wrapper({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    // return either Home or Authenticate widget or loading
    return StreamBuilder<User>(
        stream: _userViewModel.userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(child: child, scale: animation);
                },
                child: Authenticate(),
              );
            }
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: Scaffold(
                backgroundColor: Colors.grey[350],
                key: _scaffoldKey,
                appBar: AppBar(
                  title: Text('Home'),
                  centerTitle: false,
                  backgroundColor: mainColor,
                  textTheme: TextTheme(
                    headline5: TextStyle(color: Colors.white),
                  ),
                  //elevation: 0.0,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        print("Clicked chat");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                  ],
                ),
                drawer: MainDrawer(),
                endDrawer: NotificationDrawer(),
                body: child,
                bottomNavigationBar: BottomAppBar(),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
