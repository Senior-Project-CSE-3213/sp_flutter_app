class UserProfile {
  String uid;
  String firstName;
  String lastName;
  String profPicture;
  // for favoriteSports datatype might be another model or enum instead of String later
  List<String> favoriteSports;
  // stats might be another model since we might want many different attributes held on it
  String stats;
  // followers is a list of strings because it will be a list of "uid"
  List<String> followers;
  List<String> following;

  UserProfile(
      {this.uid,
      this.firstName,
      this.lastName,
      this.profPicture,
      this.favoriteSports,
      this.stats,
      this.followers,
      this.following});

  UserProfile.fromFirebase(Map<String, dynamic> data) {
    uid = data['uid'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    profPicture = data['profPicture'];
    favoriteSports = data['favoriteSports'];
    stats = data['stats'];
    followers = data['followers'];
    following = data['following'];
  }

  Map<String, dynamic> toFirebase() {
    return {
      'uid': uid,
      'lastname': lastName,
      'firstName': firstName,
      'profPicture': profPicture,
      'favoriteSports': favoriteSports,
      'stats': stats,
      'followers': followers,
      'following': following,
    };
  }

  String getFirstName() {
    return firstName;
  }

  setFirstName(final String name) {
    this.firstName = name;
  }

  String getLastName() {
    return lastName;
  }

  setLastName(final String name) {
    this.lastName = name;
  }

  String getProfPicture() {
    return profPicture;
  }

  setProfPicture(final String url) {
    this.profPicture = url;
  }

  List<String> getFollowers() {
    return followers;
  }

  setFollowers(final List<String> follows) {
    this.followers = follows;
  }

  addFollower(final String uid) {
    this.followers.add(uid);
  }

  removeFollower(final String uid) {
    this.followers.remove(uid);
  }

  List<String> getFollowing() {
    return following;
  }

  setFollowing(final List<String> followed) {
    this.followers = followed;
  }

  List<String> getFavoriteSports() {
    return favoriteSports;
  }

  setFavoriteSport(final List<String> favSports) {
    this.favoriteSports = favSports;
  }
}
