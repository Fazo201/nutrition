class UserModel {
  String? name;
  String? email;
  String? password;

  UserModel({this.name, this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["name"] = this.name;
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
