// To parse this JSON data, do
//
//     final signUpData = signUpDataFromJson(jsonString);

/*import 'dart:convert';

SignUpData signUpDataFromJson(String str) => SignUpData.fromJson(json.decode(str));

String signUpDataToJson(SignUpData data) => json.encode(data.toJson());

class SignUpData {
  SignUpData({
    required this.success,
    required this.messege,
    required this.data,
  });

  bool success;
  String messege;
  List<Datum> data;

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
    success: json["success"],
    messege: json["messege"] ?? "",
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.rememberToken,
    required this.image,
    required this.country,
    required this.state,
    required this.city,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt; // String emailVerifiedAt;
  String rememberToken;
  dynamic image; // String image;
  dynamic country; // String country;
  dynamic state; // String state;
  dynamic city; // String city;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"] == null ? "" : json["email_verified_at"],
    rememberToken: json["remember_token"],
    image: json["image"] == null ? "" : json["image"],
    country: json["country"] == null ? "" : json["country"],
    state: json["state"] == null ? "" : json["state"],
    city: json["city"] == null ? "" : json["city"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "remember_token": rememberToken,
    "image": image,
    "country": country,
    "state": state,
    "city": city,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}*/

// To parse this JSON data, do
//
//     final signUpData = signUpDataFromJson(jsonString);

import 'dart:convert';

SignUpData signUpDataFromJson(String str) => SignUpData.fromJson(json.decode(str));

String signUpDataToJson(SignUpData data) => json.encode(data.toJson());

class SignUpData {
  SignUpData({
    required this.success,
    required this.messege,
    required this.data,
  });

  bool success;
  String messege;
  List<Datum> data;

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
    success: json["success"],
    messege: json["messege"] == null ? "" : json["messege"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.rememberToken,
    required this.image,
    required this.country,
    required this.state,
    required this.city,
    required this.forgotpasswordToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String rememberToken;
  String image;
  String country;
  String state;
  String city;
  String forgotpasswordToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"] == null ? "" : json["name"],
    email: json["email"] == null ? "" : json["email"],
    emailVerifiedAt: json["email_verified_at"] == null ? "" : json["email_verified_at"],
    rememberToken: json["remember_token"] == null ? "" : json["remember_token"],
    image: json["image"] == null ? "" : json["image"],
    country: json["country"] == null ? "" : json["country"],
    state: json["state"] == null ? "" : json["state"],
    city: json["city"] == null ? "" : json["city"],
    forgotpasswordToken: json["forgotpassword_token"] == null ? "" : json["forgotpassword_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name.isEmpty ? "" : name,
    "email": email.isEmpty ? "" : email,
    "email_verified_at": emailVerifiedAt.isEmpty ? "" : emailVerifiedAt,
    "remember_token": rememberToken.isEmpty ? "" : rememberToken,
    "image": image.isEmpty ? "" : image,
    "country": country.isEmpty ? "" : country,
    "state": state.isEmpty ? "" : state,
    "city": city.isEmpty ? "" : city,
    "forgotpassword_token": forgotpasswordToken.isEmpty ? "" : forgotpasswordToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
