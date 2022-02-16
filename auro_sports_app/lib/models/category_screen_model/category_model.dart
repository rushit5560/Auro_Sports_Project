/*
class SingleCategory {
  final categoryImage;
  final categoryName;
  final itemCount;

  SingleCategory({this.categoryImage, this.categoryName, this.itemCount});
}*/

// To parse this JSON data, do
//
//     final categoryData = categoryDataFromJson(jsonString);

/*import 'dart:convert';

CategoryData categoryDataFromJson(String str) => CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  CategoryData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    this.categoryId,
    this.categoryName,
    this.categoryMetaTitle,
    this.categoryMetaDescrtiption,
    this.categoryMetaKeyword,
    this.categoryImage,
    this.parent,
    this.sortOrder,
    this.isActive,
    this.createdDate,
    this.updatedDate,
    this.createdBy,
    this.modifiedBy,
    this.showimg,
  });

  String? categoryId;
  String? categoryName;
  String? categoryMetaTitle;
  String? categoryMetaDescrtiption;
  String? categoryMetaKeyword;
  String? categoryImage;
  dynamic parent;
  String? sortOrder;
  String? isActive;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? createdBy;
  String? modifiedBy;
  String? showimg;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["categoryID"],
    categoryName: json["categoryName"],
    categoryMetaTitle: json["categoryMetaTitle"],
    categoryMetaDescrtiption: json["categoryMetaDescrtiption"],
    categoryMetaKeyword: json["categoryMetaKeyword"],
    categoryImage: json["categoryImage"],
    parent: json["parent"],
    sortOrder: json["sort_order"],
    isActive: json["is_active"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
    createdBy: json["created_by"],
    modifiedBy: json["modified_by"],
    showimg: json["showimg"],
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryId,
    "categoryName": categoryName,
    "categoryMetaTitle": categoryMetaTitle,
    "categoryMetaDescrtiption": categoryMetaDescrtiption,
    "categoryMetaKeyword": categoryMetaKeyword,
    "categoryImage": categoryImage,
    "parent": parent,
    "sort_order": sortOrder,
    "is_active": isActive,
    "created_date": createdDate!.toIso8601String(),
    "updated_date": updatedDate!.toIso8601String(),
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "showimg": showimg,
  };
}*/


// To parse this JSON data, do
//
//     final categoryData = categoryDataFromJson(jsonString);

import 'dart:convert';

CategoryData categoryDataFromJson(String str) => CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  CategoryData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.categoryId,
    required this.categoryName,
    required this.categoryMetaTitle,
    required this.categoryMetaDescrtiption,
    required this.categoryMetaKeyword,
    required this.categoryImage,
    required this.parent,
    required this.sortOrder,
    required this.isActive,
    required this.createdDate,
    required this.updatedDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.showimg,
  });

  int categoryId;
  String categoryName;
  String categoryMetaTitle;
  String categoryMetaDescrtiption;
  String categoryMetaKeyword;
  String categoryImage;
  String parent;
  String sortOrder;
  int isActive;
  DateTime createdDate;
  DateTime updatedDate;
  int createdBy;
  int modifiedBy;
  String showimg;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["categoryID"],
    categoryName: json["categoryName"] == null ? "" : json["categoryName"],
    categoryMetaTitle: json["categoryMetaTitle"] == null ? "" : json["categoryMetaTitle"],
    categoryMetaDescrtiption: json["categoryMetaDescrtiption"] == null ? "" : json["categoryMetaDescrtiption"],
    categoryMetaKeyword: json["categoryMetaKeyword"] == null ? "" : json["categoryMetaKeyword"],
    categoryImage: json["categoryImage"] == null ? "" : json["categoryImage"],
    parent: json["parent"] == null ? "" : json["parent"],
    sortOrder: json["sort_order"] == null ? "" : json["sort_order"],
    isActive: json["is_active"] == null ? 1 : json["is_active"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
    createdBy: json["created_by"] == null ? 1 : json["created_by"],
    modifiedBy: json["modified_by"] == null ? 1 : json["modified_by"],
    showimg: json["showimg"] == null ? "" : json["showimg"],
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryId,
    "categoryName": categoryName.isEmpty ? "" : categoryName,
    "categoryMetaTitle": categoryMetaTitle.isEmpty ? "" : categoryMetaTitle,
    "categoryMetaDescrtiption": categoryMetaDescrtiption.isEmpty ? "" : categoryMetaDescrtiption,
    "categoryMetaKeyword": categoryMetaKeyword.isEmpty ? "" : categoryMetaKeyword,
    "categoryImage": categoryImage.isEmpty ? "" : categoryImage,
    "parent": parent.isEmpty ? "" : parent,
    "sort_order": sortOrder.isEmpty ? "" : sortOrder,
    "is_active": isActive.toString().isEmpty ? 1 : isActive,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.toIso8601String(),
    "created_by": createdBy.toString().isEmpty ? 1 : createdBy,
    "modified_by": modifiedBy.toString().isEmpty ? 1 : modifiedBy,
    "showimg": showimg.isEmpty ? "" : showimg,
  };
}
