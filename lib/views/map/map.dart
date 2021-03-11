import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';
import 'package:sp_flutter_app/shared/widgets/subheading_text.dart';
import '../../shared/constants.dart';

class MapState extends State<MapView> with SingleTickerProviderStateMixin {
  build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldWithGradient(
      menuColor: primaryColor,
      children: [
        Container(
          height: size.height * 0.75,
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
          child: Container(
            width: size.width,
            height: size.height * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: primaryColor,
              boxShadow: [
                BoxShadow(color: primaryColor, spreadRadius: 1, blurRadius: 16),
              ],
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: null,
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Text(
                            "View Events",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(secondaryColor),
                          foregroundColor:
                              MaterialStateProperty.all(secondaryColor),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
    // return ScaffoldWithGradient(
    //   menuColor: primaryColor,
    //   children: <Widget>[
    //     Container(
    //       height: size.height * 0.70,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //           bottomLeft: Radius.circular(10.0),
    //           bottomRight: Radius.circular(10.0),
    //         ),
    //       ),
    // child: GoogleMap(
    //   myLocationButtonEnabled: false,
    //   zoomControlsEnabled: false,
    //   initialCameraPosition: CameraPosition(
    //     target: LatLng(24.142, -110.321),
    //     zoom: 15,
    //   ),
    // ),
    //     ),
    //   ],
    // );
  }
}

class MapView extends StatefulWidget {
  State<StatefulWidget> createState() => MapState();
}
