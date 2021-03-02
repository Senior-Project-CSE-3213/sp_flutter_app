import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/views/authenticate/create_profile.dart';
import 'onboarding/onboarding.dart';
import '../models/user.dart';
import '../shared/constants.dart';
import '../shared/widgets/main_drawer.dart';
import '../shared/widgets/notification_drawer.dart';
import '../viewmodels/user_viewmodel.dart';

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
    // if the user in the userview model is empty, but the user is authed
    if (_userViewModel?.user?.uid == null ||
        _userViewModel?.user?.email == null) {
      _userViewModel.populateUserModelFromFirebase();
    }
    // return either MapView, OnboardingView, CreateProfile or loading
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
                child: OnboardingView(),
              );
            } else if (_userViewModel.profileCreated) {
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
                    backgroundColor: primaryColor,
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
              // the user is authenticated, BUT the profile isn't created
              if (_userViewModel.user?.uid == null) {
                // this is needed if the user tried to register, but then closed
                // the app while on the create profile screen. Firebase alreeady
                // registered this user and there is an auth token in the app, but
                // the user hasn't created their profile
                _userViewModel.user = _userViewModel.getCurrentUser();
              }
              return CreateProfile();
            }
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
