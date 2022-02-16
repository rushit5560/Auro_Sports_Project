// To parse this JSON data, do
//
//     final addCartQtyData = addCartQtyDataFromJson(jsonString);

import 'dart:convert';

AddCartQtyData addCartQtyDataFromJson(String str) => AddCartQtyData.fromJson(json.decode(str));

String addCartQtyDataToJson(AddCartQtyData data) => json.encode(data.toJson());

class AddCartQtyData {
  AddCartQtyData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  int data;

  factory AddCartQtyData.fromJson(Map<String, dynamic> json) => AddCartQtyData(
    success: json["success"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
  };
}
