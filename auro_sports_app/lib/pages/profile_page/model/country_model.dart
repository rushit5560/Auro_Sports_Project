// To parse this JSON data, do
//
//     final allCountryData = allCountryDataFromJson(jsonString);

import 'dart:convert';

AllCountryData allCountryDataFromJson(String str) => AllCountryData.fromJson(json.decode(str));

String allCountryDataToJson(AllCountryData data) => json.encode(data.toJson());

class AllCountryData {
  AllCountryData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory AllCountryData.fromJson(Map<String, dynamic> json) => AllCountryData(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.sortname,
    required this.name,
  });

  int id;
  String sortname;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sortname: json["sortname"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sortname": sortname,
    "name": name,
  };
}
