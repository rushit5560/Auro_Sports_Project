// To parse this JSON data, do
//
//     final orderDetailsData = orderDetailsDataFromJson(jsonString);

import 'dart:convert';

OrderDetailsData orderDetailsDataFromJson(String str) => OrderDetailsData.fromJson(json.decode(str));

String orderDetailsDataToJson(OrderDetailsData data) => json.encode(data.toJson());

class OrderDetailsData {
  OrderDetailsData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) => OrderDetailsData(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.productInOrderId,
    required this.orderid,
    required this.productId,
    required this.quantity,
    required this.productname,
    required this.sku,
    required this.totalCost,
    required this.taxvalue,
    required this.variyantid,
    required this.productKg,
    required this.total,
    required this.createdDate,
    required this.updatedDate,
  });

  int productInOrderId;
  int orderid;
  int productId;
  int quantity;
  String productname;
  String sku;
  int totalCost;
  String taxvalue;
  String variyantid;
  String productKg;
  int total;
  DateTime createdDate;
  String updatedDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productInOrderId: json["productInOrderId"] == null ? 0 : json["productInOrderId"],
    orderid: json["orderid"] == null ? 0 : json["orderid"],
    productId: json["product_id"] == null ? 0 : json["product_id"],
    quantity: json["quantity"] == null ? 0 : json["quantity"],
    productname: json["productname"] == null ? "" : json["productname"],
    sku: json["sku"] == null ? "" : json["sku"],
    totalCost: json["totalCost"] == null ? 0 : json["totalCost"],
    taxvalue: json["taxvalue"] == null ? "" : json["taxvalue"],
    variyantid: json["variyantid"] == null ? "" : json["variyantid"],
    productKg: json["product_kg"] == null ? "" : json["product_kg"],
    total: json["total"] == null ? 0 : json["total"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"] == null ? "" : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "productInOrderId": productInOrderId.toString().isEmpty ? 0 : productInOrderId,
    "orderid": orderid.toString().isEmpty ? 0 : orderid,
    "product_id": productId.toString().isEmpty ? 0 : productId,
    "quantity": quantity.toString().isEmpty ? 0 : quantity,
    "productname": productname.isEmpty ? "" : productname,
    "sku": sku.isEmpty ? "" : sku,
    "totalCost": totalCost.toString().isEmpty ? 0 : totalCost,
    "taxvalue": taxvalue.isEmpty ? "" : taxvalue,
    "variyantid": variyantid.isEmpty ? "" : variyantid,
    "product_kg": productKg.isEmpty ? "" : productKg,
    "total": total.toString().isEmpty ? 0 : total,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.isEmpty ? "" : updatedDate,
  };
}
