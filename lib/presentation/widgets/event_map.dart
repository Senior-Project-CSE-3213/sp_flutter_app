import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMapState extends State<EventMap> {
  build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(24.142, -110.321),
        zoom: 15,
      ),
    );
  }
}

class EventMap extends StatefulWidget {
  State<StatefulWidget> createState() => EventMapState();
}
