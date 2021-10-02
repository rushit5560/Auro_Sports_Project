// To parse this JSON data, do
//
//     final orderAddData = orderAddDataFromJson(jsonString);

import 'dart:convert';

OrderAddData orderAddDataFromJson(String str) => OrderAddData.fromJson(json.decode(str));

String orderAddDataToJson(OrderAddData data) => json.encode(data.toJson());

class OrderAddData {
  OrderAddData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory OrderAddData.fromJson(Map<String, dynamic> json) => OrderAddData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
