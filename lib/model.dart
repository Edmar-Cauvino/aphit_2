class myMode {
  String objectId;
  String username;
  String email;
  String password;
  String createdAt;
  String updatedAt;

  myMode(
      {this.objectId,
        this.username,
        this.email,
        this.password,
        this.createdAt,
        this.updatedAt});

  myMode.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
