// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    required this.message,
    required this.data,
    required this.dd,
    required this.page,
    required this.pages,
    required this.count,
    required this.videoDuration,
  });

  String message;
  List<Datum> data;
  int dd;
  int page;
  int pages;
  int count;
  int videoDuration;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dd: json["dd"],
        page: json["page"],
        pages: json["pages"],
        count: json["count"],
        videoDuration: json["videoDuration"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "dd": dd,
        "page": page,
        "pages": pages,
        "count": count,
        "videoDuration": videoDuration,
      };
}

class Datum {
  Datum({
    required this.postUrl,
  });
  String postUrl;
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        postUrl: json["PostUrl"],
      );
  Map<String, dynamic> toJson() => {
        "PostUrl": postUrl,
      };
}
