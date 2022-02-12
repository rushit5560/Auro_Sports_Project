import 'dart:convert';

UpdateProfileData updateProfileDataFromJson(String str) => UpdateProfileData.fromJson(json.decode(str));

String updateProfileDataToJson(UpdateProfileData data) => json.encode(data.toJson());

class UpdateProfileData {
  UpdateProfileData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory UpdateProfileData.fromJson(Map<String, dynamic> json) => UpdateProfileData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
