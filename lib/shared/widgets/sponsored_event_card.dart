import 'package:flutter/material.dart';

class SponsoredEventCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;

  const SponsoredEventCard({
    this.title,
    this.location,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
          height: 210,
          width: 280,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(27, 109, 255, 1),
                Color.fromRGBO(39, 82, 228, 1)
              ], //or 16,60,98 to 37,139,191
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
          child: Column(
            //column holds all text on container
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //this starts the children of the card
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        _titleLengthCheck(this.title),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        _locationLengthCheck(this.location),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.playlist_add_check_sharp, //flutter icon
                        color: Colors.white,
                        size: 50),
                    SizedBox(
                      width: 80,
                    ),
                    SizedBox(
                      width: 100.0,
                      child: Text(
                        _timeLengthCheck(this.date),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  String _titleLengthCheck(String eventTitle) {
    return (eventTitle.length > 33
        ? eventTitle.substring(0, 30) + "..."
        : eventTitle);
  }

  String _locationLengthCheck(String eventLocation) {
    //
    return (eventLocation.length > 33
        ? eventLocation.substring(0, 30) + "..."
        : eventLocation);
  }

  String _timeLengthCheck(String eventTime) {
    return (eventTime.length > 20
        ? eventTime.substring(0, 17) + "..."
        : eventTime);
  }
}
