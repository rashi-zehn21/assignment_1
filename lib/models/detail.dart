// To parse this JSON data, do
//
//     final homeDetail = homeDetailFromJson(jsonString);

import 'dart:convert';

HomeDetail homeDetailFromJson(String str) =>
    HomeDetail.fromJson(json.decode(str));

String homeDetailToJson(HomeDetail data) => json.encode(data.toJson());

class HomeDetail {
  HomeDetail({
    this.data,
  });

  List<Datum>? data;

  factory HomeDetail.fromJson(Map<String, dynamic> json) => HomeDetail(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.trainingName,
    this.duration,
    this.ratings,
  });

  String? trainingName;
  String? duration;
  String? ratings;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainingName:
            json["Training_Name"] == null ? null : json["Training_Name"],
        duration: json["Duration"] == null ? null : json["Duration"],
        ratings: json["Ratings"] == null ? null : json["Ratings"],
      );

  Map<String, dynamic> toJson() => {
        "Training_Name": trainingName == null ? null : trainingName,
        "Duration": duration == null ? null : duration,
        "Ratings": ratings == null ? null : ratings,
      };
}
