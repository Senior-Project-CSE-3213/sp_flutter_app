// Sponsored Events
class SEvent {
  String title;
  String location;
  String date;

  SEvent({this.title, this.location, this.date});

  SEvent.fromFirebase(Map<String, dynamic> eventData) {
    title = eventData['title'];
    location = eventData['location'];
    date = eventData['date'];
  }

  String getTitle() {
    return this.title;
  }

  String getLocation() {
    return this.location;
  }

  String getDate() {
    return this.date;
  }
}

// Latest events
class LEvent {
  String title;
  String location;
  String date;

  LEvent({this.title, this.location, this.date});

  LEvent.fromFirebase(Map<String, dynamic> eventData) {
    title = eventData['title'];
    location = eventData['location'];
    date = eventData['date'];
  }

  String getTitle() {
    return this.title;
  }

  String getLocation() {
    return this.location;
  }

  String getDate() {
    return this.date;
  }
}
