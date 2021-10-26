// To parse this JSON data, do
//
//     final suggestionModel = suggestionModelFromJson(jsonString);

import 'dart:convert';

SuggestionModel suggestionModelFromJson(String str) => SuggestionModel.fromJson(json.decode(str));

String suggestionModelToJson(SuggestionModel data) => json.encode(data.toJson());

class SuggestionModel {
  SuggestionModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  String status;
  String success;
  String message;
  List<Datum> data;

  factory SuggestionModel.fromJson(Map<String, dynamic> json) => SuggestionModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.oauthProvider,
    this.oauthUid,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.locale,
    this.picture,
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
  String link;
  DateTime created;
  String copenNumber;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    oauthProvider: json["oauth_provider"],
    oauthUid: json["oauth_uid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    password: json["password"],
    locale: json["locale"],
    picture: json["picture"],
    link: json["link"],
    created: DateTime.parse(json["created"]),
    copenNumber: json["copen_number"],
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
    "link": link,
    "created": created.toIso8601String(),
    "copen_number": copenNumber,
  };
}
