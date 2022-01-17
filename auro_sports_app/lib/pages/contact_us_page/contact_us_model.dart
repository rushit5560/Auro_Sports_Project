import 'dart:convert';

ContactUsData contactUsDataFromJson(String str) => ContactUsData.fromJson(json.decode(str));

String contactUsDataToJson(ContactUsData data) => json.encode(data.toJson());

class ContactUsData {
  ContactUsData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ContactUsData.fromJson(Map<String, dynamic> json) => ContactUsData(
    success: json["success"] == null ? false : json["success"],
    message: json["message"] == null ? "" : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
