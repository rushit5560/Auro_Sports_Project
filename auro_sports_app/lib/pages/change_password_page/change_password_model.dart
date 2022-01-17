import 'dart:convert';

ChangePasswordData changePasswordDataFromJson(String str) => ChangePasswordData.fromJson(json.decode(str));

String changePasswordDataToJson(ChangePasswordData data) => json.encode(data.toJson());

class ChangePasswordData {
  ChangePasswordData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ChangePasswordData.fromJson(Map<String, dynamic> json) => ChangePasswordData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
