class UserModel {
  int id;
  String name;
  String email;
  String username;
  String profilePhoteUrl;
  String token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.profilePhoteUrl,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilePhoteUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_phote_url': profilePhoteUrl,
      'token': token,
    };
  }
}
