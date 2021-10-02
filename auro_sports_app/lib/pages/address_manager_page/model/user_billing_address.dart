// To parse this JSON data, do
//
//     final billingAddressData = billingAddressDataFromJson(jsonString);

import 'dart:convert';

BillingAddressData billingAddressDataFromJson(String str) => BillingAddressData.fromJson(json.decode(str));

String billingAddressDataToJson(BillingAddressData data) => json.encode(data.toJson());

class BillingAddressData {
  BillingAddressData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory BillingAddressData.fromJson(Map<String, dynamic> json) => BillingAddressData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
