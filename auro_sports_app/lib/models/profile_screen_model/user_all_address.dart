// To parse this JSON data, do
//
//     final userAllAddressData = userAllAddressDataFromJson(jsonString);

import 'dart:convert';

UserAllAddressData userAllAddressDataFromJson(String str) => UserAllAddressData.fromJson(json.decode(str));

String userAllAddressDataToJson(UserAllAddressData data) => json.encode(data.toJson());

class UserAllAddressData {
  UserAllAddressData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory UserAllAddressData.fromJson(Map<String, dynamic> json) => UserAllAddressData(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.shippinginfo,
    required this.billinginfo,
  });

  Inginfo shippinginfo;
  Inginfo billinginfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    shippinginfo: Inginfo.fromJson(json["shippinginfo"]),
    billinginfo: Inginfo.fromJson(json["billinginfo"]),
  );

  Map<String, dynamic> toJson() => {
    "shippinginfo": shippinginfo.toJson(),
    "billinginfo": billinginfo.toJson(),
  };
}

class Inginfo {
  Inginfo({
    required this.id,
    required this.userId,
    required this.isShipping,
    required this.isBilling,
    required this.address,
    required this.mobile,
    required this.email,
    required this.createdDate,
    required this.updatedDate,
    required this.modifiedByAdmin,
  });

  int id;
  int userId;
  int isShipping;
  int isBilling;
  String address;
  String mobile;
  String email;
  String createdDate;
  String updatedDate;
  String modifiedByAdmin;

  factory Inginfo.fromJson(Map<String, dynamic> json) => Inginfo(
    id: json["id"],
    userId: json["user_id"],
    isShipping: json["is_shipping"] == null ? 1 : json["is_shipping"],
    isBilling: json["is_billing"] == null ? 1 : json["is_billing"],
    address: json["address"] == null ? "" : json["address"],
    mobile: json["mobile"] == null ? "" : json["mobile"],
    email: json["email"] == null ? "" : json["email"],
    createdDate: json["created_date"] == null ? "" : json["created_date"],
    updatedDate: json["updated_date"] == null ? "" : json["updated_date"],
    modifiedByAdmin: json["modified_by_admin"] == null ? "" : json["modified_by_admin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "is_shipping": isShipping.toString().isEmpty ? "" : isShipping,
    "is_billing": isBilling.toString().isEmpty ? "" : isBilling,
    "address": address.isEmpty ? "" : address,
    "mobile": mobile.isEmpty ? "" : mobile,
    "email": email.isEmpty ? "" : email,
    "created_date": createdDate.isEmpty ? "" : createdDate,
    "updated_date": updatedDate.isEmpty ? "" : updatedDate,
    "modified_by_admin": modifiedByAdmin.isEmpty ? "" : modifiedByAdmin,
  };
}
