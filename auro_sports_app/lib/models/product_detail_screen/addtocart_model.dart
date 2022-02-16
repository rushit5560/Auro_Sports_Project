// To parse this JSON data, do
//
//     final addToCartData = addToCartDataFromJson(jsonString);

import 'dart:convert';

AddToCartData addToCartDataFromJson(String str) => AddToCartData.fromJson(json.decode(str));

String addToCartDataToJson(AddToCartData data) => json.encode(data.toJson());

class AddToCartData {
  AddToCartData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory AddToCartData.fromJson(Map<String, dynamic> json) => AddToCartData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
