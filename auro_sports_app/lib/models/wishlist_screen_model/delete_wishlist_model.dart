// To parse this JSON data, do
//
//     final deleteWishlistData = deleteWishlistDataFromJson(jsonString);

import 'dart:convert';

DeleteWishlistData deleteWishlistDataFromJson(String str) => DeleteWishlistData.fromJson(json.decode(str));

String deleteWishlistDataToJson(DeleteWishlistData data) => json.encode(data.toJson());

class DeleteWishlistData {
  DeleteWishlistData({
    required  this.success,
    required  this.message,
  });

  bool success;
  String message;

  factory DeleteWishlistData.fromJson(Map<String, dynamic> json) => DeleteWishlistData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
