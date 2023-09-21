import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String username;
  String email;
  String password;
  String registrationDate;
  int v;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.registrationDate,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    registrationDate: json["registrationDate"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "password": password,
    "registrationDate": registrationDate,
    "__v": v,
  };
}
