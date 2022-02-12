// To parse this JSON data, do
//
//     final stateData = stateDataFromJson(jsonString);

import 'dart:convert';

StateData stateDataFromJson(String str) => StateData.fromJson(json.decode(str));

String stateDataToJson(StateData data) => json.encode(data.toJson());

class StateData {
  StateData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<DatumState> data;

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
    success: json["success"],
    message: json["message"],
    data: List<DatumState>.from(json["data"].map((x) => DatumState.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumState {
  DatumState({
    required this.id,
    required this.name,
    required this.countryId,
  });

  int id;
  String name;
  int countryId;

  factory DatumState.fromJson(Map<String, dynamic> json) => DatumState(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
  };
}
