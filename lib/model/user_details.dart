class UserDetails {
  String? displayName;
  String? email;
  String? photoURL;

  UserDetails({this.displayName, this.email, this.photoURL});

  UserDetails.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    photoURL = json["photoURL"];
    email = json["email"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['displayName'] = displayName;
    data['email'] = email;
    data['photoURL'] = photoURL;
    return data;
  }
}
