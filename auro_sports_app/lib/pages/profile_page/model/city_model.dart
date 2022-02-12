// To parse this JSON data, do
//
//     final cityData = cityDataFromJson(jsonString);

import 'dart:convert';

CityData cityDataFromJson(String str) => CityData.fromJson(json.decode(str));

String cityDataToJson(CityData data) => json.encode(data.toJson());

class CityData {
  CityData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<DatumCity> data;

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    success: json["success"],
    message: json["message"],
    data: List<DatumCity>.from(json["data"].map((x) => DatumCity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumCity {
  DatumCity({
    required this.id,
    required this.name,
    required this.stateId,
  });

  int id;
  String name;
  int stateId;

  factory DatumCity.fromJson(Map<String, dynamic> json) => DatumCity(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
  };
}
