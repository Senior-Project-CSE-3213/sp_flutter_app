import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sp_flutter_app/shared/widgets/full_width_text_btn_with_icon.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';
import 'package:sp_flutter_app/shared/widgets/subheading_text.dart';
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
    final size = MediaQuery.of(context).size;

    return ScaffoldWithGradient(
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
        Align(
          alignment: Alignment.bottomCenter,
          child: OrientationBuilder(builder: (context, orientation) {
            return DraggableScrollableSheet(
              minChildSize: 0.10,
              initialChildSize: 0.15,
              maxChildSize: 0.75,
              builder: (context, scrollController) {
                return Container(
                  width: size.width,
                  // remove height to make container adaptive to content
                  // height: size.height * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: primaryColor, spreadRadius: 1, blurRadius: 16),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: kDefaultPadding),
                          SubHeadingText(
                            text: "Swip Up!",
                            align: TextAlign.center,
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          HeadingText(
                            text: "View Latest Events",
                            align: TextAlign.center,
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          SubHeadingText(
                            text:
                                "Filter by sports, area, availability, and much more!",
                            align: TextAlign.center,
                          ),
                          SizedBox(
                            height: kDefaultPadding * 2.0,
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: Text(
                                  "View Latest Events",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 2.0,
                                primary: blueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kDefaultPadding * 2.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
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
