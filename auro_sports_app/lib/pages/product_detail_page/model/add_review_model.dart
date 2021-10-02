import 'dart:convert';
// To parse this JSON data, do
//
//     final reviewAddData = reviewAddDataFromJson(jsonString);

ReviewAddData reviewAddDataFromJson(String str) => ReviewAddData.fromJson(json.decode(str));

String reviewAddDataToJson(ReviewAddData data) => json.encode(data.toJson());

class ReviewAddData {
  ReviewAddData({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ReviewAddData.fromJson(Map<String, dynamic> json) => ReviewAddData(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
