import 'package:flutter/material.dart';
import 'package:sp_flutter_app/shared/widgets/simple_text_input_field.dart';

Future createEventDialog(BuildContext context) async {
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
                                  errorFormatText: "That's not a valid date :/",
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
                                  errorFormatText: "That's not a valid date :/",
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
                                      borderRadius: BorderRadius.circular(18.0),
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
                                      borderRadius: BorderRadius.circular(18.0),
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

                              if (absoluteEndTime.isBefore(absoluteStartTime)) {
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
