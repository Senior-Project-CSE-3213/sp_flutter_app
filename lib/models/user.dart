class User {
  String uid;
  String email;

  User({this.uid, this.email});

  /*
    Desc: This method will take the data from the firebase query and map it to this User instance.
  */
  User.fromFirebase(Map<String, dynamic> data) {
    uid = data['uid'];
    email = data['email'];
  }

  Map<String, dynamic> toFirebase() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  setEmail(final String email) {
    this.email = email;
  }

  String getEmail() {
    return this.email;
  }
}
