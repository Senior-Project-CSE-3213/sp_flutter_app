import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../shared/widgets/notification_drawer.dart';
import 'package:sp_flutter_app/views/wrapper.dart';

class EventDetailScreen extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  EventDetailScreen({
    Key key,
    @required this.child,
  }) : super(key: key);

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      color: Colors.blueAccent[400],
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                  hintText: "Send a question",
                  hintStyle: TextStyle(color: Colors.white)),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
            iconSize: 25,
            color: Colors.blue.shade900,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          endDrawer: NotificationDrawer(),
          body: Stack(alignment: Alignment.center, children: <Widget>[
            Container(
              color: Colors.blue[900], // Your screen background color
            ),
            SizedBox(
              width: 500,
              height: 650,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'My Dark, Twisted Football Tournament',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                            //height: 5,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          //height: 100,
                          color: Colors.blueAccent[400],
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2, color: Colors.blue[900])),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.blue[900],
                                ),
                              ),
                              Text(
                                'Created by \nKanye West',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2, color: Colors.blue[900])),
                                child: Icon(
                                  Icons.calendar_view_day,
                                  color: Colors.blue[900],
                                ),
                              ),
                              Text(
                                'Starts \n2/14/21',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              Spacer()
                            ],
                          )),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                          alignment: Alignment.center,
                          // height: 180,
                          padding: EdgeInsets.all(10),
                          child: freshPrinceText),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                          alignment: Alignment.center,
                          //height: 180,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 175,
                                height: 120,
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://cdn.wccftech.com/wp-content/uploads/2017/03/Google-Maps.jpg',
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Spacer(),
                              Text(
                                'X miles from you...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              Spacer()
                            ],
                          )),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      // height: 180,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'PARTICIPANTS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(children: <Widget>[
                        Container(
                            width: 250,
                            height: 180,
                            padding: EdgeInsets.all(10),
                            child: NestedScrollView(
                              headerSliverBuilder: (BuildContext context,
                                  bool innerBoxIsScrolled) {
                                return <Widget>[
                                  // SliverAppBar(
                                  //   title: Text('NestedScrollView'),
                                  // )
                                ];
                              },
                              body: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 80,
                                    color: Colors.blueAccent[400],
                                    // color: Colors.primaries[
                                    //     index % Colors.primaries.length],
                                    alignment: Alignment.center,
                                    child: Chip(
                                      avatar: CircleAvatar(
                                          backgroundColor: Colors.blue.shade900,
                                          child: Icon(Icons.person)),
                                      label: Text('Name $index'),
                                      labelPadding: EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          bottom: 20,
                                          top: 20),
                                    ),
                                  );
                                },
                                itemCount: 20,
                              ),
                            )),
                        Spacer(),
                        RaisedButton(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            print('Clicked Sign Up button');
                          },
                          color: Colors.blueAccent[400],
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blue[900],
                        ),
                        Spacer()
                      ]),
                    )
                  ])),
            ),
            new Positioned(
              top: 10.0,
              left: 0.0,
              right: 0.0,
              height: 30,
              child: AppBar(
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor:
                    mainColor.withOpacity(0), //You can make this transparent
                elevation: 0.0, //No shadow
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
            new Container(
                alignment: Alignment.bottomCenter, child: _sendMessageArea()),
          ])),
    );
  }
}
