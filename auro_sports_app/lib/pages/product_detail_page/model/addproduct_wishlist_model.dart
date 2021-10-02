// To parse this JSON data, do
//
//     final addProductWishlistData = addProductWishlistDataFromJson(jsonString);

import 'dart:convert';

AddProductWishlistData addProductWishlistDataFromJson(String str) => AddProductWishlistData.fromJson(json.decode(str));

String addProductWishlistDataToJson(AddProductWishlistData data) => json.encode(data.toJson());

class AddProductWishlistData {
  AddProductWishlistData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  String data;
  String message;

  factory AddProductWishlistData.fromJson(Map<String, dynamic> json) => AddProductWishlistData(
    success: json["success"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data,
    "message": message,
  };
}
