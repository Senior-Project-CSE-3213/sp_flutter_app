import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../shared/constants.dart';

class MapState extends State<MapView> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(24.142, -110.321),
              zoom: 15,
            ),
          ),
        ),
        Container(
          //width: 90,
          //height: 90,
          child: Stack(
            children: <Widget>[
              Positioned(
                  right: 30,
                  bottom: 30,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      IgnorePointer(
                        child: Container(
                          color: Colors.black.withOpacity(
                              0.0), // comment or change to transparent color
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),
                            degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.location_searching,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('clicked find location button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(225),
                            degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('clicked filter button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),
                            degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('clicked search button');
                            },
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: CircularButton(
                            color: mainColor,
                            width: 60,
                            height: 60,
                            icon: Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                            onClick: () {
                              if (animationController.isCompleted) {
                                animationController.reverse();
                              } else {
                                animationController.forward();
                              }
                            }),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class MapView extends StatefulWidget {
  State<StatefulWidget> createState() => MapState();
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}
