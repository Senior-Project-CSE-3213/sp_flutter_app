import 'package:flutter/material.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class MainDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: mainColor,
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 35,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          'http://2.bp.blogspot.com/-uQGdZGmyng0/T83p7wQV2hI/AAAAAAAABtQ/gwqY3Gx-PYw/s1600/Bulldog.jpeg',
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  'Anonymous',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )
              ],
            )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(profileScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text(
              'Events',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              if (ModalRoute.of(context)?.settings?.name !=
                  eventMapScreenRoute) {
                Navigator.of(context).pushNamed(eventMapScreenRoute);
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(settingScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(helpScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.event_note),
            title: Text(
              'Event Detail Example',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(eventDetailScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.event_note),
            title: Text(
              'All User Profiles',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(allUserProfilesScreenRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
