// To parse this JSON data, do
//
//     final signInData = signInDataFromJson(jsonString);

/*import 'dart:convert';

SignInData signInDataFromJson(String str) => SignInData.fromJson(json.decode(str));

// String signInDataToJson(SignInData data) => json.encode(data.toJson());

class SignInData {
  SignInData({
    required this.success,
    required this.messege,
    required this.data,
  });

  bool success;
  String messege;
  Data data;
  // List<Data> data;

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
    success: json["success"] != null ? json["success"] : false,
    messege: json["messege"] ?? "",
    data: Data.fromJson(json["data"]),
    // data: json["data"] == null ? [] : json["data"],
  );

  // Map<String, dynamic> toJson() => {
  //   "success": success,
  //   "messege": messege,
  //   "data": data.toJson(),
  // };
}

class Data {
  Data({
    required this.id,
    required this.token,
  });

  String id;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"] ?? "",
    token: json["Token"] ?? "",
  );

  // Map<String, dynamic> toJson() => {
  //   "ID": id,
  //   "Token": token,
  // };
}*/

// To parse this JSON data, do
//
//     final signInData = signInDataFromJson(jsonString);

import 'dart:convert';

SignInData signInDataFromJson(String str) => SignInData.fromJson(json.decode(str));

String signInDataToJson(SignInData data) => json.encode(data.toJson());

class SignInData {
  SignInData({
    required this.success,
    required this.messege,
    required this.data,
  });

  bool success;
  String messege;
  Data data;

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
    success: json["success"],
    messege: json["messege"] == null ? "" : json["messege"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.token,
  });

  int id;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"] == null ? 0 : json["ID"],
    token: json["Token"] == null ? "" : json["Token"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id.toString().isEmpty ? 0 : id,
    "Token": token.isEmpty ? "" : token,
  };
}
