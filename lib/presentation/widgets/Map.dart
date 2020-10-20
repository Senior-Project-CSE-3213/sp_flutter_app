import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sp_flutter_app/presentation/widgets/CustomAppBar.dart';
//import 'package:sp_flutter_app/presentation/widgets/CustomBottomNavBar.dart';

class MapState extends State<Map> {



  build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(24.142, -110.321),
                zoom: 15,
              ),
          ),
        ],
      ),

    );
  }
}

class Map extends StatefulWidget {
  State<StatefulWidget> createState() => MapState();
}


