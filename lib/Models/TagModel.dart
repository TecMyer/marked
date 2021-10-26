// To parse this JSON data, do
//
//     final tagModel = tagModelFromJson(jsonString);

import 'dart:convert';

TagModel tagModelFromJson(String str) => TagModel.fromJson(json.decode(str));

String tagModelToJson(TagModel data) => json.encode(data.toJson());

class TagModel {
  TagModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  String status;
  String success;
  String message;
  Data data;

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.tags,
  });

  String tags;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tags: json["tags"],
  );

  Map<String, dynamic> toJson() => {
    "tags": tags,
  };
}
