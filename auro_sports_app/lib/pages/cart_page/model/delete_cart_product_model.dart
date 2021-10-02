// To parse this JSON data, do
//
//     final deleteCartProductData = deleteCartProductDataFromJson(jsonString);

import 'dart:convert';

DeleteCartProductData deleteCartProductDataFromJson(String str) => DeleteCartProductData.fromJson(json.decode(str));

String deleteCartProductDataToJson(DeleteCartProductData data) => json.encode(data.toJson());

class DeleteCartProductData {
  DeleteCartProductData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory DeleteCartProductData.fromJson(Map<String, dynamic> json) => DeleteCartProductData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
