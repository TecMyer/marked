// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  String status;
  String success;
  String message;
  List<NotifactionDatum> data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<NotifactionDatum>.from(json["data"].map((x) => NotifactionDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NotifactionDatum {
  NotifactionDatum({
    this.followerId,
    this.message,
  });

  String followerId;
  String message;

  factory NotifactionDatum.fromJson(Map<String, dynamic> json) => NotifactionDatum(
    followerId: json["follower_id"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "follower_id": followerId,
    "message": message,
  };
}
