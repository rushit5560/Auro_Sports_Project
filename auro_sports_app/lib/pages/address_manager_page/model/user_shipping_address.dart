// To parse this JSON data, do
//
//     final shippingAddressData = shippingAddressDataFromJson(jsonString);

import 'dart:convert';

ShippingAddressData shippingAddressDataFromJson(String str) => ShippingAddressData.fromJson(json.decode(str));

String shippingAddressDataToJson(ShippingAddressData data) => json.encode(data.toJson());

class ShippingAddressData {
  ShippingAddressData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ShippingAddressData.fromJson(Map<String, dynamic> json) => ShippingAddressData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
