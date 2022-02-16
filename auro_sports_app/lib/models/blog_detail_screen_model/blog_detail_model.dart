// To parse this JSON data, do
//
//     final blogDetailsData = blogDetailsDataFromJson(jsonString);

/*
import 'dart:convert';

BlogDetailsData blogDetailsDataFromJson(String str) => BlogDetailsData.fromJson(json.decode(str));

String blogDetailsDataToJson(BlogDetailsData data) => json.encode(data.toJson());

class BlogDetailsData {
  BlogDetailsData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory BlogDetailsData.fromJson(Map<String, dynamic> json) => BlogDetailsData(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.sortOrder,
    required this.isActive,
    required this.relatedBlogs,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.updatedDate,
  });

  String id;
  String title;
  String content;
  String image;
  String sortOrder;
  String isActive;
  String relatedBlogs;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  String createdBy;
  String modifiedBy;
  DateTime createdDate;
  DateTime updatedDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? "" : json["id"],
    title: json["title"] == null ? "" : json["title"],
    content: json["content"] == null ? "" : json["content"],
    image: json["image"] == null ? "" : json["image"],
    sortOrder: json["sort_order"] == null ? "" : json["sort_order"],
    isActive: json["is_active"] == null ? "" : json["is_active"],
    relatedBlogs: json["related_blogs"] == null ? "" : json["related_blogs"],
    metaTitle: json["meta_title"] == null ? "" : json["meta_title"],
    metaDescription: json["meta_description"] == null ? "" : json["meta_description"],
    metaKeywords: json["meta_keywords"] == null ? "" : json["meta_keywords"],
    createdBy: json["created_by"] == null ? "" : json["created_by"],
    modifiedBy: json["modified_by"] == null ? "" : json["modified_by"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id.isEmpty ? "" : id,
    "title": title.isEmpty ? "" : title,
    "content": content.isEmpty ? "" : content,
    "image": image.isEmpty ? "" : image,
    "sort_order": sortOrder.isEmpty ? "" : sortOrder,
    "is_active": isActive.isEmpty ? "" : isActive,
    "related_blogs": relatedBlogs.isEmpty ? "" : relatedBlogs,
    "meta_title": metaTitle.isEmpty ? "" : metaTitle,
    "meta_description": metaDescription.isEmpty ? "" : metaDescription,
    "meta_keywords": metaKeywords.isEmpty ? "" : metaKeywords,
    "created_by": createdBy.isEmpty ? "" : createdBy,
    "modified_by": modifiedBy.isEmpty ? "" : modifiedBy,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.toIso8601String(),
  };
}
*/


// To parse this JSON data, do
//
//     final blogDetailsData = blogDetailsDataFromJson(jsonString);

import 'dart:convert';

BlogDetailsData blogDetailsDataFromJson(String str) => BlogDetailsData.fromJson(json.decode(str));

String blogDetailsDataToJson(BlogDetailsData data) => json.encode(data.toJson());

class BlogDetailsData {
  BlogDetailsData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory BlogDetailsData.fromJson(Map<String, dynamic> json) => BlogDetailsData(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.sortOrder,
    required this.isActive,
    required this.relatedBlogs,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.updatedDate,
  });

  int id;
  String title;
  String content;
  String image;
  String sortOrder;
  int isActive;
  String relatedBlogs;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  int createdBy;
  int modifiedBy;
  DateTime createdDate;
  DateTime updatedDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"] == null ? "" : json["title"],
    content: json["content"] == null ? "" : json["content"],
    image: json["image"] == null ? "" : json["image"],
    sortOrder: json["sort_order"] == null ? "" : json["sort_order"],
    isActive: json["is_active"] == null ? 1 : json["is_active"],
    relatedBlogs: json["related_blogs"] == null ? "" : json["related_blogs"],
    metaTitle: json["meta_title"] == null ? "" : json["meta_title"],
    metaDescription: json["meta_description"] == null ? "" : json["meta_description"],
    metaKeywords: json["meta_keywords"] == null ? "" : json["meta_keywords"],
    createdBy: json["created_by"].toString().isEmpty ? 1 : json["created_by"],
    modifiedBy: json["modified_by"].toString().isEmpty ? 1 : json["modified_by"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title.isEmpty ? "" : title,
    "content": content.isEmpty ? "" : content,
    "image": image.isEmpty ? "" : image,
    "sort_order": sortOrder.isEmpty ? "" : sortOrder,
    "is_active": isActive.toString().isEmpty ? 1 : isActive,
    "related_blogs": relatedBlogs.isEmpty ? "" : relatedBlogs,
    "meta_title": metaTitle.isEmpty ? "" : metaTitle,
    "meta_description": metaDescription.isEmpty ? "" : metaDescription,
    "meta_keywords": metaKeywords.isEmpty ? "" : metaKeywords,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.toIso8601String(),
  };
}
