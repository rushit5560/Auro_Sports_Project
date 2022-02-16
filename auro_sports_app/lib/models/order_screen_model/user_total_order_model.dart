// To parse this JSON data, do
//
//     final totalOrdersData = totalOrdersDataFromJson(jsonString);

import 'dart:convert';

TotalOrdersData totalOrdersDataFromJson(String str) => TotalOrdersData.fromJson(json.decode(str));

String totalOrdersDataToJson(TotalOrdersData data) => json.encode(data.toJson());

class TotalOrdersData {
  TotalOrdersData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory TotalOrdersData.fromJson(Map<String, dynamic> json) => TotalOrdersData(
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
    required this.orderId,
    required this.totalprice,
    required this.totalqty,
    required this.couponid,
    required this.coupontype,
    required this.couponvalue,
    required this.couponprice,
    required this.userFname,
    required this.userLname,
    required this.userCompanyname,
    required this.userCountryId,
    required this.userStreetAddress,
    required this.userCity,
    required this.usersState,
    required this.userPhone,
    required this.userEmail,
    required this.userOrderNote,
    required this.orderType,
    required this.image,
    required this.status,
    required this.orderPdf,
    required this.filepath,
    required this.userId,
    required this.createdDate,
    required this.updatedDate,
  });

  int orderId;
  String totalprice;
  String totalqty;
  String couponid;
  String coupontype;
  String couponvalue;
  String couponprice;
  String userFname;
  String userLname;
  String userCompanyname;
  int userCountryId;
  String userStreetAddress;
  String userCity;
  String usersState;
  String userPhone;
  String userEmail;
  String userOrderNote;
  String orderType;
  String image;
  int status;
  String orderPdf;
  String filepath;
  int userId;
  DateTime createdDate;
  String updatedDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderId: json["orderId"],
    totalprice: json["totalprice"] == null ? "" : json["totalprice"],
    totalqty: json["totalqty"] == null ? "" : json["totalqty"],
    couponid: json["couponid"] == null ? "" : json["couponid"],
    coupontype: json["coupontype"] == null ? "" : json["coupontype"],
    couponvalue: json["couponvalue"] == null ? "" : json["couponvalue"],
    couponprice: json["couponprice"] == null ? "" : json["couponprice"],
    userFname: json["userFname"] == null ? "" : json["userFname"],
    userLname: json["userLname"] == null ? "" : json["userLname"],
    userCompanyname: json["userCompanyname"] == null ? "" : json["userCompanyname"],
    userCountryId: json["userCountry_id"] == null ? 1 : json["userCountry_id"],
    userStreetAddress: json["userStreet_address"] == null ? "" : json["userStreet_address"],
    userCity: json["userCity"] == null ? "" : json["userCity"],
    usersState: json["usersState"] == null ? "" : json["usersState"],
    userPhone: json["userPhone"] == null ? "" : json["userPhone"],
    userEmail: json["userEmail"] == null ? "" : json["userEmail"],
    userOrderNote: json["userOrderNote"] == null ? "" : json["userOrderNote"],
    orderType: json["order_type"] == null ? "" : json["order_type"],
    image: json["image"] == null ? "" : json["image"],
    status: json["status"] == null ? 0 : json["status"],
    orderPdf: json["order_pdf"] == null ? "" : json["order_pdf"],
    filepath: json["filepath"] == null ? "" : json["filepath"],
    userId: json["userId"] == null ? 0 : json["userId"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"] == null ? "" : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "totalprice": totalprice.isEmpty ? "" : totalprice,
    "totalqty": totalqty.isEmpty ? "" : totalqty,
    "couponid": couponid.isEmpty ? "" : couponid,
    "coupontype": coupontype.isEmpty ? "" : coupontype,
    "couponvalue": couponvalue.isEmpty ? "" : couponvalue,
    "couponprice": couponprice.isEmpty ? "" : couponprice,
    "userFname": userFname.isEmpty ? "" : userFname,
    "userLname": userLname.isEmpty ? "" : userLname,
    "userCompanyname": userCompanyname.isEmpty ? "" : userCompanyname,
    "userCountry_id": userCountryId.toString().isEmpty ? 1 : userCountryId,
    "userStreet_address": userStreetAddress.isEmpty ? "" : userStreetAddress,
    "userCity": userCity.isEmpty ? "" : userCity,
    "usersState": usersState.isEmpty ? "" : usersState,
    "userPhone": userPhone.isEmpty ? "" : userPhone,
    "userEmail": userEmail.isEmpty ? "" : userEmail,
    "userOrderNote": userOrderNote.isEmpty ? "" : userOrderNote,
    "order_type": orderType.isEmpty ? "" : orderType,
    "image": image.isEmpty ? "" : image,
    "status": status.toString().isEmpty ? 0 : status,
    "order_pdf": orderPdf.isEmpty ? "" : orderPdf,
    "filepath": filepath.isEmpty ? "" : filepath,
    "userId": userId.toString().isEmpty ? "" : userId,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.isEmpty ? "" : updatedDate,
  };
}
