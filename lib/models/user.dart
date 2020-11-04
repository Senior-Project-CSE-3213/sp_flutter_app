class User {
  String uid;
  String username;
  String email;
  String phoneNumber;

  User({this.uid, this.username, this.email, this.phoneNumber});

  /*
    Desc: This method will take the data from the firebase query and map it to this User instance.
  */
  User.fromFirebase(Map<String, dynamic> data) {
    uid = data['uid'];
    username = data['displayName'];
    email = data['email'];
    phoneNumber = data['phoneNumber'];
  }

  Map<String, dynamic> toFirebase() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  setUsername(final String username) {
    this.username = username;
  }

  String getUsername() {
    return this.username;
  }

  setEmail(final String email) {
    this.email = email;
  }

  String getEmail() {
    return this.email;
  }

  setPhoneNumber(final String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  String getPhoneNumber() {
    return this.phoneNumber;
  }
}
