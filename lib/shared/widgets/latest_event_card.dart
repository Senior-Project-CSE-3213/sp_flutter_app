import 'package:flutter/material.dart';

import '../constants.dart';

class LatestEventCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;

  static getCardHeight() {
    return 80.0;
  }

  const LatestEventCard({
    this.title,
    this.location,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
          height: getCardHeight(),
          width: 180,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(40, 47, 67, 1),
                Color.fromRGBO(40, 47, 67, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Column(
            //column holds all text on container
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(
                    _titleLengthCheck(this.title),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),

              SizedBox(
                height: 2,
              ), //spacer

              Expanded(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _locationLengthCheck(this.location),
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      _timeLengthCheck(this.date),
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ],
                )),
              ),
            ],
          )),
    );
  }

  String _titleLengthCheck(String eventTitle) {
    return (eventTitle.length > 40
        ? eventTitle.substring(0, 37) + "..."
        : eventTitle);
  }

  String _locationLengthCheck(String eventLocation) {
    return (eventLocation.length > 23
        ? eventLocation.substring(0, 20) + "..."
        : eventLocation);
  }

  String _timeLengthCheck(String eventTime) {
    return (eventTime.length > 23
        ? eventTime.substring(0, 20) + "..."
        : eventTime);
  }
}
