// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  String status;
  String success;
  String message;
  List<LoginDatum> data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<LoginDatum>.from(json["data"].map((x) => LoginDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class LoginDatum {
  LoginDatum({
    this.id,
    this.oauthProvider,
    this.oauthUid,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.locale,
    this.picture,
    this.bio,
    this.link,
    this.created,
    this.copenNumber,
  });

  String id;
  String oauthProvider;
  String oauthUid;
  String firstName;
  String lastName;
  String email;
  String password;
  String locale;
  String picture;
  String bio;
  String link;
  String created;
  String copenNumber;

  factory LoginDatum.fromJson(Map<String, dynamic> json) => LoginDatum(
    id: json["id"],
    oauthProvider: json["oauth_provider"].toString(),
    oauthUid: json["oauth_uid"].toString(),
    firstName: json["first_name"].toString(),
    lastName: json["last_name"].toString(),
    email: json["email"].toString(),
    password: json["password"].toString(),
    locale: json["locale"].toString(),
    picture: json["picture"].toString(),
    bio: json["bio"].toString(),
    link: json["link"].toString(),
    created: json["created"].toString(),
    copenNumber: json["copen_number"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "oauth_provider": oauthProvider,
    "oauth_uid": oauthUid,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "locale": locale,
    "picture": picture,
    "bio": bio,
    "link": link,
    "created": created,
    "copen_number": copenNumber,
  };
}
