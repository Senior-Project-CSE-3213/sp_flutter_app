import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sp_flutter_app/shared/constants.dart';
import 'package:sp_flutter_app/shared/widgets/heading_text.dart';
import 'package:sp_flutter_app/shared/widgets/scaffold_with_gradient.dart';
import 'package:sp_flutter_app/shared/widgets/simple_text_input_field.dart';

class EventListView extends StatefulWidget {
  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  List<String> countList = [
    "Alphabetical",
    "Newest",
    "Oldest",
    "Soonest",
    "Latest"
  ];
  List<String> selectedCountList = [];

  void _openFilterDialog() async {
    await FilterListDialog.display(context,
        listData: countList,
        height: 380,
        borderRadius: 20,
        headlineText: "Select Filters",
        searchFieldHintText: "Search Here",
        selectedListData: selectedCountList, onApplyButtonClick: (list) {
      if (list != null) {
        setState(() {
          selectedCountList = List.from(list);
        });
      }
      Navigator.pop(context);
    });
  }

  String _formatEventDate(DateTime dt) {
    int weekday = dt.weekday;
    String weekdayName = "";

    switch (weekday) {
      case 1:
        weekdayName = "Monday";
        break;
      case 2:
        weekdayName = "Tuesday";
        break;
      case 3:
        weekdayName = "Wednesday";
        break;
      case 4:
        weekdayName = "Thursday";
        break;
      case 5:
        weekdayName = "Friday";
        break;
      case 6:
        weekdayName = "Saturday";
        break;
      case 7:
        weekdayName = "Sunday";
        break;
    }

    int month = dt.month;
    String monthName = "";

    switch (month) {
      case 1:
        monthName = "January";
        break;
      case 2:
        monthName = "February";
        break;
      case 3:
        monthName = "March";
        break;
      case 4:
        monthName = "April";
        break;
      case 5:
        monthName = "May";
        break;
      case 6:
        monthName = "June";
        break;
      case 7:
        monthName = "July";
        break;
      case 8:
        monthName = "August";
        break;
      case 9:
        monthName = "September";
        break;
      case 10:
        monthName = "October";
        break;
      case 11:
        monthName = "November";
        break;
      case 12:
        monthName = "December";
        break;
    }
    return "$weekdayName $monthName ${dt.day}, ${dt.year}";
  }

  Future<void> _informSuccess(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(25, 28, 35, 1),
          title: Text(
            "Event Created",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  "Your event has been successfuly created!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Others should now be able to see your event and register.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Sounds good'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future _createEventDialog(BuildContext context) async {
    DateTime pickedStartDate = DateTime.now();
    TimeOfDay pickedStartTime = TimeOfDay.now();
    DateTime pickedEndDate = DateTime.now();
    TimeOfDay pickedEndTime = TimeOfDay.now();

    DateTime initStartDate = pickedStartDate;
    TimeOfDay initStartTime = pickedStartTime;
    DateTime initEndDate = pickedEndDate;
    TimeOfDay initEndTime = pickedEndTime;

    String eventLocation = "";
    String eventTitle = "";
    String errorMessage = "";

    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Color.fromRGBO(25, 28, 35, 1),
              content: Container(
                child: Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Event Title",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SimpleTextInputField(
                          error: false,
                          handleChange: (val) {
                            eventTitle = val;
                          },
                          handleSubmit: () {},
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Event Location",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SimpleTextInputField(
                          error: false,
                          handleChange: (val) {
                            eventLocation = val;
                          },
                          handleSubmit: () {
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                                  child: Text(
                                    "Select Start",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                            color:
                                                Color.fromRGBO(25, 28, 35, 1),
                                          ))),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    // ignore: missing_return
                                    (Set<MaterialState> states) {
                                      return Color.fromRGBO(125, 62, 255,
                                          1); // Use the component's default.
                                    },
                                  ),
                                ),
                                onPressed: () async {
                                  DateTime date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                    initialDate: pickedStartDate,
                                    initialEntryMode: DatePickerEntryMode.input,
                                    helpText: "Select start date",
                                    cancelText: "Cancel",
                                    confirmText: "OK",
                                    fieldLabelText: "Event start date",
                                    fieldHintText: "Month/Date/Year",
                                    errorFormatText:
                                        "That's not a valid date :/",
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData
                                            .dark(), // This will change to light theme.
                                        child: child,
                                      );
                                    },
                                  );

                                  if (date != null) {
                                    setState(() {
                                      pickedStartDate = date;
                                    });
                                  }

                                  TimeOfDay time = await showTimePicker(
                                    context: context,
                                    initialTime: pickedStartTime,
                                    helpText: "Select start time",
                                    cancelText: "Cancel",
                                    confirmText: "OK",
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData
                                            .dark(), // This will change to light theme.
                                        child: child,
                                      );
                                    },
                                  );

                                  if (time != null) {
                                    setState(() {
                                      pickedStartTime = time;
                                    });
                                  }
                                },
                              ),
                              ElevatedButton(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                                  child: Text(
                                    "Select End",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                            color:
                                                Color.fromRGBO(25, 28, 35, 1),
                                          ))),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    // ignore: missing_return
                                    (Set<MaterialState> states) {
                                      return Color.fromRGBO(125, 62, 255,
                                          1); // Use the component's default.
                                    },
                                  ),
                                ),
                                onPressed: () async {
                                  DateTime date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2025),
                                    initialDate: pickedStartDate,
                                    initialEntryMode: DatePickerEntryMode.input,
                                    helpText: "Select end date",
                                    cancelText: "Cancel",
                                    confirmText: "OK",
                                    fieldLabelText: "Event end date",
                                    fieldHintText: "Month/Date/Year",
                                    errorFormatText:
                                        "That's not a valid date :/",
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.dark(),
                                        child: child,
                                      );
                                    },
                                  );

                                  if (date != null) {
                                    setState(() {
                                      pickedEndDate = date;
                                    });
                                  }

                                  TimeOfDay time = await showTimePicker(
                                    context: context,
                                    initialTime: pickedStartTime,
                                    helpText: "Select end time",
                                    cancelText: "Cancel",
                                    confirmText: "OK",
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.dark(),
                                        child: child,
                                      );
                                    },
                                  );

                                  if (date != null) {
                                    setState(() {
                                      pickedEndTime = time;
                                    });
                                  }
                                },
                              ),
                            ]),
                        SizedBox(height: 10),
                        ListTile(
                          title: Text(
                            (pickedStartDate == initStartDate ||
                                        pickedStartDate == null
                                    ? "Start date: not chosen yet"
                                    : "Start date: ${_formatEventDate(pickedStartDate)}") +
                                "\n" +
                                ((pickedStartTime == initStartTime ||
                                        pickedStartTime == null)
                                    ? "Start time: not chosen yet"
                                    : "Start time: ${pickedStartTime.hour > 12 ? pickedStartTime.hour - 12 : pickedStartTime.hour}:" +
                                        "${pickedStartTime.minute.toString().length == 1 ? "0" : ""}${pickedStartTime.minute}${pickedStartTime.hour >= 12 ? "PM" : "AM"} (${pickedStartDate.timeZoneName})") +
                                "\n" +
                                (pickedEndDate == initEndDate ||
                                        pickedEndDate == null
                                    ? "End date: not chosen yet"
                                    : "End date: ${_formatEventDate(pickedEndDate)}") +
                                "\n" +
                                ((pickedEndTime == initEndTime ||
                                        pickedEndTime == null
                                    ? "End Time: not chosen yet"
                                    : "End Time: ${pickedEndTime.hour > 12 ? pickedEndTime.hour - 12 : pickedEndTime.hour}:" +
                                        "${pickedEndTime.minute.toString().length == 1 ? "0" : ""}${pickedEndTime.minute}${pickedEndTime.hour >= 12 ? "PM" : "AM"} (${pickedEndDate.timeZoneName})")),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                                child: Text(
                                  "Discard",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                          color: Color.fromRGBO(25, 28, 35, 1),
                                        ))),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  // ignore: missing_return
                                  (Set<MaterialState> states) {
                                    return Color.fromRGBO(125, 62, 255,
                                        1); // Use the component's default.
                                  },
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop([null]);
                              },
                            ),
                            ElevatedButton(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                                child: Text(
                                  "Create",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                          color: Color.fromRGBO(25, 28, 35, 1),
                                        ))),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  // ignore: missing_return
                                  (Set<MaterialState> states) {
                                    return Color.fromRGBO(125, 62, 255,
                                        1); // Use the component's default.
                                  },
                                ),
                              ),
                              onPressed: () {
                                print("Validating data...");
                                var currentDate = DateTime.now();
                                var currentTime = TimeOfDay.now();

                                if (pickedStartDate == null) {
                                  pickedStartDate = DateTime.now();
                                }

                                if (pickedStartTime == null) {
                                  pickedStartTime = TimeOfDay.now();
                                }

                                if (pickedEndDate == null) {
                                  pickedEndDate = DateTime.now();
                                }

                                if (pickedEndTime == null) {
                                  pickedEndTime = TimeOfDay.now();
                                }

                                if (currentDate == null) {
                                  currentDate = DateTime.now();
                                }

                                if (currentTime == null) {
                                  currentTime = TimeOfDay.now();
                                }

                                var absoluteCurrentTime = new DateTime(
                                    currentDate.year,
                                    currentDate.month,
                                    currentDate.day,
                                    currentTime.hour,
                                    currentTime.minute);

                                var absoluteStartTime = new DateTime(
                                    pickedStartDate.year,
                                    pickedStartDate.month,
                                    pickedStartDate.day,
                                    pickedStartTime.hour,
                                    pickedStartTime.minute);

                                var absoluteEndTime = new DateTime(
                                    pickedEndDate.year,
                                    pickedEndDate.month,
                                    pickedEndDate.day,
                                    pickedEndTime.hour,
                                    pickedEndTime.minute);

                                if (absoluteEndTime
                                    .isBefore(absoluteStartTime)) {
                                  setState(() {
                                    errorMessage =
                                        "End time is before start time";
                                  });
                                } else if (absoluteEndTime
                                    .isBefore(absoluteCurrentTime)) {
                                  setState(() {
                                    errorMessage =
                                        "End time is before current time";
                                  });
                                } else if (absoluteStartTime
                                    .isBefore(absoluteCurrentTime)) {
                                  setState(() {
                                    errorMessage =
                                        "Start time is before current time";
                                  });
                                } else if (eventTitle == null ||
                                    eventTitle.toString().length == 0) {
                                  setState(() {
                                    errorMessage = "Invalid event title";
                                  });
                                } else if (eventLocation == null ||
                                    eventLocation.toString().length == 0) {
                                  setState(() {
                                    errorMessage = "Invalid event location";
                                  });
                                } else if (pickedStartDate == null ||
                                    pickedStartDate.toString().length == 0 ||
                                    pickedStartDate == initStartDate) {
                                  setState(() {
                                    errorMessage = "Invalid start date";
                                  });
                                } else if (pickedStartTime == null ||
                                    pickedStartTime.toString().length == 0 ||
                                    pickedStartTime == initStartTime) {
                                  setState(() {
                                    errorMessage = "Invalid start time";
                                  });
                                } else if (pickedEndDate == null ||
                                    pickedEndDate.toString().length == 0 ||
                                    pickedEndDate == initEndDate) {
                                  setState(() {
                                    errorMessage = "Invalid end date";
                                  });
                                } else if (pickedEndTime == null ||
                                    pickedEndTime.toString().length == 0 ||
                                    pickedEndTime == initEndTime) {
                                  setState(() {
                                    errorMessage = "Invalid end time";
                                  });
                                } else {
                                  print(eventTitle.toString());
                                  print(eventLocation.toString());
                                  print(pickedStartDate.toString());
                                  print(pickedStartTime.toString());
                                  print(pickedEndDate.toString());
                                  print(pickedEndTime.toString());

                                  //TODO put event details in database and update client views

                                  Navigator.of(context).pop([null]);
                                  _informSuccess(context);
                                }
                              },
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            "$errorMessage",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ScaffoldWithGradient(
      bottomBar: true,
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                        bottom: kDefaultPadding,
                      ),
                      child: HeadingText(
                        text: "Sponsored Events",
                        scale: 0.5,
                        align: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 210,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            CreateSponsoredEventCard(
                                "Become an RA interest meeting",
                                "Taylor Auditorium",
                                "Wednesday, 7:30PM"),
                            CreateSponsoredEventCard("Intramural Football",
                                "Intramural Fields", "Friday, 6:30PM"),
                            CreateSponsoredEventCard("Dawgs After Dark",
                                "The Hump", "Thursday, 9:30PM"),
                            CreateSponsoredEventCard("Cowbell yell",
                                "Bettersworth Auditorium", "Sunday, 5:00PM"),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //latest event
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding,
                          ),
                          child: HeadingText(
                            text: "Latest Events",
                            scale: 0.5,
                            align: TextAlign.left,
                          ),
                        ),
                        Container(
                          //take away this
                          child: IconButton(
                            icon: Icon(Icons.filter_list),
                            color: Colors.white,
                            onPressed: _openFilterDialog,
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          CreateLatestEventCard("Intramural Football",
                              "Intramural Fields", "Friday, 6:30PM"),
                          CreateLatestEventCard("Dawgs After Dark", "The Hump",
                              "Thursday, 9:30PM"),
                          CreateLatestEventCard("Cowbell yell",
                              "Bettersworth Auditorium", "Sunday, 5:00PM"),
                          CreateLatestEventCard("Become an RA interest meeting",
                              "Taylor Auditorium", "Wednesday, 7:30PM"),
                          CreateLatestEventCard("Become an RA interest meeting",
                              "Taylor Auditorium", "Wednesday, 7:30PM"),
                          CreateLatestEventCard("Become an RA interest meeting",
                              "Taylor Auditorium", "Wednesday, 7:30PM"),
                        ],
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
  }
}

// ignore: must_be_immutable
class CreateSponsoredEventCard extends StatelessWidget {
  String eventTitle;
  String eventLocation;
  String eventTime;

  CreateSponsoredEventCard(String title, String location, String time) {
    eventTitle = title;
    eventLocation = location;
    eventTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
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
                          _titleLengthCheck(this.eventTitle),
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
                          _locationLengthCheck(this.eventLocation),
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
                          _timeLengthCheck(this.eventTime),
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
      ),
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

// ignore: must_be_immutable
class CreateLatestEventCard extends StatelessWidget {
  String eventTitle;
  String eventLocation;
  String eventTime;

  static getCardHeight() {
    return 80.0;
  }

  CreateLatestEventCard(String title, String location, String time) {
    eventTitle = title;
    eventLocation = location;
    eventTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
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
                      _titleLengthCheck(this.eventTitle),
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
                        _locationLengthCheck(this.eventLocation),
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        _timeLengthCheck(this.eventTime),
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
      ),
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
