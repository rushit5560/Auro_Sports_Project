// To parse this JSON data, do
//
//     final bannerList = bannerListFromJson(jsonString);

import 'dart:convert';

/*BannerList bannerListFromJson(String str) => BannerList.fromJson(json.decode(str));

String bannerListToJson(BannerList data) => json.encode(data.toJson());

class BannerList {
  BannerList({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
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
    required this.bannerId,
    required this.title,
    this.sortOrder,
    this.url,
    this.bannerGroupId,
    this.containerName,
    required this.viewPageCount,
    this.bannerGroupBannerGroupId,
    required this.link,
    required this.image,
    required this.imagePath,
    required this.content,
    required this.position,
    required this.isActive,
    required this.createdDate,
    this.modifiedDate,
    required this.createdBy,
    this.modifiedBy,
  });

  String bannerId;
  String title;
  dynamic sortOrder;
  dynamic url;
  dynamic bannerGroupId;
  dynamic containerName;
  String viewPageCount;
  dynamic bannerGroupBannerGroupId;
  String link;
  String image;
  String imagePath;
  String content;
  String position;
  String isActive;
  DateTime createdDate;
  dynamic modifiedDate;
  String createdBy;
  dynamic modifiedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    bannerId: json["banner_id"] == null ? "" : json["banner_id"],
    title: json["title"] == null ? "" : json["title"],
    sortOrder: json["sort_order"],
    url: json["url"],
    bannerGroupId: json["banner_group_id"],
    containerName: json["container_name"],
    viewPageCount: json["view_page_count"] == null ? "" : json["view_page_count"],
    bannerGroupBannerGroupId: json["banner_group_banner_group_id"],
    link: json["link"] == null ? "" : json["link"],
    image: json["image"] == null ? "" : json["image"],
    imagePath: json["image_path"] == null ? "" : json["image_path"],
    content: json["content"] == null ? "" : json["content"],
    position: json["position"] == null ? "" : json["position"],
    isActive: json["is_active"] == null ? "" : json["is_active"],
    createdDate: DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"],
    createdBy: json["created_by"] == null ? "" : json["created_by"],
    modifiedBy: json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId.isEmpty ? "" : bannerId,
    "title": title.isEmpty ? "" : title,
    "sort_order": sortOrder,
    "url": url,
    "banner_group_id": bannerGroupId,
    "container_name": containerName,
    "view_page_count": viewPageCount.isEmpty ? "" : viewPageCount,
    "banner_group_banner_group_id": bannerGroupBannerGroupId,
    "link": link.isEmpty ? "" : link,
    "image": image.isEmpty ? "" : image,
    "image_path": imagePath.isEmpty ? "" : imagePath,
    "content": content.isEmpty ? "" : content,
    "position": position.isEmpty ? "" : position,
    "is_active": isActive.isEmpty ? "" : isActive,
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate,
    "created_by": createdBy.isEmpty ? "" : createdBy,
    "modified_by": modifiedBy,
  };
}*/

// ---------------------------------------------
// New Model After Change Api Url


BannerData bannerDataFromJson(String str) => BannerData.fromJson(json.decode(str));

String bannerDataToJson(BannerData data) => json.encode(data.toJson());

class BannerData {
  BannerData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
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
    required this.bannerId,
    required this.title,
    required this.sortOrder,
    required this.url,
    required this.bannerGroupId,
    required this.containerName,
    required this.viewPageCount,
    required this.bannerGroupBannerGroupId,
    required this.link,
    required this.image,
    required this.imagePath,
    required this.content,
    required this.position,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  int bannerId;
  String title;
  String sortOrder;
  String url;
  String bannerGroupId;
  String containerName;
  int viewPageCount;
  String bannerGroupBannerGroupId;
  String link;
  String image;
  String imagePath;
  String content;
  int position;
  int isActive;
  DateTime createdDate;
  String modifiedDate;
  int createdBy;
  String modifiedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    bannerId: json["banner_id"],
    title: json["title"] == null ? "" : json["title"],
    sortOrder: json["sort_order"] == null ? "" : json["sort_order"],
    url: json["url"] == null ? "" : json["url"],
    bannerGroupId: json["banner_group_id"] == null ? "" : json["banner_group_id"],
    containerName: json["container_name"] == null ? "" : json["container_name"],
    viewPageCount: json["view_page_count"] == null ? 0 : json["view_page_count"],
    bannerGroupBannerGroupId: json["banner_group_banner_group_id"] == null ? "" : json["banner_group_banner_group_id"],
    link: json["link"] == null ? "" : json["link"],
    image: json["image"] == null ? "" : json["image"],
    imagePath: json["image_path"] == null ? "" : json["image_path"],
    content: json["content"] == null ? "" : json["content"],
    position: json["position"],
    isActive: json["is_active"] == null ? 1 : json["is_active"],
    createdDate: DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? "" : json["modified_date"],
    createdBy: json["created_by"] == null ? 1 : json["created_by"],
    modifiedBy: json["modified_by"] == null ? "" : json["modified_by"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "title": title.isEmpty ? "" : title,
    "sort_order": sortOrder.isEmpty ? "" : sortOrder,
    "url": url.isEmpty ? "" : url,
    "banner_group_id": bannerGroupId.isEmpty ? "" : bannerGroupId,
    "container_name": containerName.isEmpty ? "" : containerName,
    "view_page_count": viewPageCount.toString().isEmpty ? 0 : viewPageCount,
    "banner_group_banner_group_id": bannerGroupBannerGroupId.isEmpty ? "" : bannerGroupBannerGroupId,
    "link": link.isEmpty ? "" : link,
    "image": image.isEmpty ? "" : image,
    "image_path": imagePath.isEmpty ? "" : imagePath,
    "content": content.isEmpty? "" : content,
    "position": position,
    "is_active": isActive.toString().isEmpty ? 1 : isActive,
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate.isEmpty ? "" : modifiedDate,
    "created_by": createdBy.toString().isEmpty ? 1 : createdBy,
    "modified_by": modifiedBy.isEmpty ? "" : modifiedBy,
  };
}

