// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  ArticleModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  String status;
  String success;
  String message;
  List<ArticleDatum> data;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: List<ArticleDatum>.from(json["data"].map((x) => ArticleDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ArticleDatum {
  ArticleDatum({
    this.id,
    this.userId,
    this.dataType,
    this.title,
    this.url,
    this.pageUrl,
    this.pageDescription,
    this.baseUrl,
    this.websiteName,
    this.imageUrl,
    this.urlId,
    this.favIcon,
    this.archive,
    this.favourite,
    this.tags,
    this.highlight,
    this.beauty,
    this.trend,
    this.creationDate,
  });

  String id;
  String userId;
  String dataType;
  String title;
  String url;
  String pageUrl;
  String pageDescription;
  String baseUrl;
  String websiteName;
  String imageUrl;
  String urlId;
  String favIcon;
  String archive;
  String favourite;
  String tags;
  String highlight;
  String beauty;
  String trend;
  DateTime creationDate;

  factory ArticleDatum.fromJson(Map<String, dynamic> json) => ArticleDatum(
    id: json["id"],
    userId: json["user_id"],
    dataType: json["data_type"],
    title: json["title"],
    url: json["url"],
    pageUrl: json["page_url"],
    pageDescription: json["page_description"],
    baseUrl: json["base_url"],
    websiteName: json["website_name"],
    imageUrl: json["image_url"],
    urlId: json["url_id"],
    favIcon: json["favIcon"].toString(),
    archive: json["archive"],
    favourite: json["favourite"],
    tags: json["tags"].toString(),
    highlight: json["highlight"],
    beauty: json["beauty"],
    trend: json["trend"],
    creationDate: DateTime.parse(json["creation_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "data_type": dataType,
    "title": title,
    "url": url,
    "page_url": pageUrl,
    "page_description": pageDescription,
    "base_url": baseUrl,
    "website_name": websiteName,
    "image_url": imageUrl,
    "url_id": urlId,
    "favIcon": favIcon,
    "archive": archive,
    "favourite": favourite,
    "tags": tags,
    "highlight": highlight,
    "beauty": beauty,
    "trend": trend,
    "creation_date": "${creationDate.year.toString().padLeft(4, '0')}-${creationDate.month.toString().padLeft(2, '0')}-${creationDate.day.toString().padLeft(2, '0')}",
  };
}
