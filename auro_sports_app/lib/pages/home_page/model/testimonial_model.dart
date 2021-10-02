/*
class TestimonialData {
  late bool success;
  late List<Data> data;
  late String message;

  TestimonialData({required this.success, required this.data, required this.message});

  TestimonialData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data.isNotEmpty) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  late String id;
  late String name;
  late String image;
  late String shortDescritpon;
  late String description;
  late String location;
  late String isActive;
  late String createdBy;
  late String modifiedBy;
  late String createdDate;
  late String updatedDate;
  late String showimg;

  Data(
      {required this.id,
        required this.name,
        required this.image,
        required this.shortDescritpon,
        required this.description,
        required this.location,
        required this.isActive,
        required this.createdBy,
        required this.modifiedBy,
        required this.createdDate,
        required this.updatedDate,
        required this.showimg});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? "" : json['id'];
    name = json['name'] == null ? "" : json['name'];
    image = json['image'] == null ? "" : json['image'];
    shortDescritpon = json['short_descritpon'] == null ? "" : json['short_descritpon'];
    description = json['description'] == null ? "" : json['description'];
    location = json['location'] == null ? "" : json['location'];
    isActive = json['is_active'] == null ? "" : json['is_active'];
    createdBy = json['created_by'] == null ? "" : json['created_by'];
    modifiedBy = json['modified_by'] == null ? "" : json['modified_by'];
    createdDate = json['created_date'] == null ? "" : json['created_date'];
    updatedDate = json['updated_date'] == null ? "" : json['updated_date'];
    showimg = json['showimg'] == null ? "" : json['showimg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.isEmpty ? "" : this.id;
    data['name'] = this.name.isEmpty ? "" : this.name;
    data['image'] = this.image.isEmpty ? "" : this.image;
    data['short_descritpon'] = this.shortDescritpon.isEmpty ? "" : this.shortDescritpon;
    data['description'] = this.description.isEmpty ? "" : this.description;
    data['location'] = this.location.isEmpty ? "" : this.location;
    data['is_active'] = this.isActive.isEmpty ? "" : this.isActive;
    data['created_by'] = this.createdBy.isEmpty ? "" : this.createdBy;
    data['modified_by'] = this.modifiedBy.isEmpty ? "" : this.modifiedBy;
    data['created_date'] = this.createdDate.isEmpty ? "" : this.createdDate;
    data['updated_date'] = this.updatedDate.isEmpty ? "" : this.updatedDate;
    data['showimg'] = this.showimg.isEmpty ? "" : this.showimg;
    return data;
  }
}*/


// To parse this JSON data, do
//
//     final testimonialData = testimonialDataFromJson(jsonString);

import 'dart:convert';

TestimonialData testimonialDataFromJson(String str) => TestimonialData.fromJson(json.decode(str));

String testimonialDataToJson(TestimonialData data) => json.encode(data.toJson());

class TestimonialData {
  TestimonialData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Data> data;
  String message;

  factory TestimonialData.fromJson(Map<String, dynamic> json) => TestimonialData(
    success: json["success"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.image,
    required this.shortDescritpon,
    required this.description,
    required this.location,
    required this.isActive,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.updatedDate,
    required this.showimg,
  });

  int id;
  String name;
  String image;
  String shortDescritpon;
  String description;
  String location;
  int isActive;
  int createdBy;
  int modifiedBy;
  DateTime createdDate;
  DateTime updatedDate;
  String showimg;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"] == null ? "" : json["name"],
    image: json["image"] == null ? "" : json["image"],
    shortDescritpon: json["short_descritpon"] == null ? "" : json["short_descritpon"],
    description: json["description"] == null ? "" : json["description"],
    location: json["location"] == null ? "" : json["location"],
    isActive: json["is_active"] == null ? 1 : json["is_active"],
    createdBy: json["created_by"],
    modifiedBy: json["modified_by"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
    showimg: json["showimg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "short_descritpon": shortDescritpon.isEmpty ? "" : shortDescritpon,
    "description": description,
    "location": location,
    "is_active": isActive,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.toIso8601String(),
    "showimg": showimg,
  };
}
