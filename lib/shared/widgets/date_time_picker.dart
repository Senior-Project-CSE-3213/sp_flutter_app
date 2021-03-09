import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime createdEventDate;

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _dateTime;
  TimeOfDay _timeOfDay;

  DateTime _finalDate;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(_finalDate == null
            ? 'Choose a date'
            : new DateFormat("MM-dd-yyyy @hh:mm a'").format(_finalDate)),
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2023))
              .then((date) {
            _dateTime = date;
            showTimePicker(context: context, initialTime: TimeOfDay.now())
                .then((time) {
              _timeOfDay = time;
              setState(() {
                _finalDate = new DateTime(_dateTime.year, _dateTime.month,
                    _dateTime.day, _timeOfDay.hour, _timeOfDay.minute);
                createdEventDate = _finalDate;
              });
            });
          });
        });
  }
}
