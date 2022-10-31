// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.data,
  });

  List<Datum>? data;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
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
