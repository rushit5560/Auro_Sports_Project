// To parse this JSON data, do
//
//     final productDetailsData = productDetailsDataFromJson(jsonString);
/*
import 'dart:convert';

ProductDetailsData productDetailsDataFromJson(String str) => ProductDetailsData.fromJson(json.decode(str));

String productDetailsDataToJson(ProductDetailsData data) => json.encode(data.toJson());

class ProductDetailsData {
  ProductDetailsData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) => ProductDetailsData(
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
    required this.id,
    required this.productname,
    required this.sku,
    required this.productslug,
    required this.fullText,
    required this.category,
    required this.upc,
    required this.quantity,
    required this.outofStockStatus,
    required this.dateavailable,
    required this.sortorder,
    required this.brandId,
    required this.variantsValues,
    required this.metaTagKeyword,
    required this.metaTagDescription,
    required this.showimg,
    required this.metaTagTitle,
    required this.productcost,
    required this.tax,
    required this.taxvalue,
    required this.totalcost,
    required this.requiredshipping,
    required this.width,
    required this.height,
    required this.length,
    required this.weight,
    required this.minimumkg,
    required this.isActive,
    required this.images,
    required this.feature,
    required this.todaydeals,
    required this.relatedProducts,
    required this.topProduct,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
  });

  String id;
  String productname;
  String sku;
  String productslug;
  String fullText;
  String category;
  dynamic upc;
  String quantity;
  String outofStockStatus;
  dynamic dateavailable;
  dynamic sortorder;
  dynamic brandId;
  String variantsValues;
  String metaTagKeyword;
  String metaTagDescription;
  String showimg;
  String metaTagTitle;
  String productcost;
  String tax;
  String taxvalue;
  String totalcost;
  String requiredshipping;
  String width;
  String height;
  String length;
  String weight;
  String minimumkg;
  String isActive;
  List<String> images;
  String feature;
  String todaydeals;
  String relatedProducts;
  dynamic topProduct;
  dynamic createdBy;
  dynamic modifiedBy;
  dynamic createdDate;
  dynamic modifiedDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? "" : json["id"],
    productname: json["productname"] == null ? "" : json["productname"],
    sku: json["sku"] == null ? "" : json["sku"],
    productslug: json["productslug"] == null ? "" : json["productslug"],
    fullText: json["full_text"] == null ? "" : json["full_text"],
    category: json["category"] == null ? "" : json["category"],
    upc: json["upc"] == null ? "" : json["upc"],
    quantity: json["quantity"] == null ? "" : json["quantity"],
    outofStockStatus: json["OutofStockStatus"] == null ? "" : json["OutofStockStatus"],
    dateavailable: json["dateavailable"] == null ? "" : json["dateavailable"],
    sortorder: json["sortorder"] == null ? "" : json["sortorder"],
    brandId: json["brand_id"] == null ? "" : json["brand_id"],
    variantsValues: json["variants_values"] == null ? "" : json["variants_values"],
    metaTagKeyword: json["meta_tag_Keyword"] == null ? "" : json["meta_tag_Keyword"],
    metaTagDescription: json["meta_tag_description"] == null ? "" : json["meta_tag_description"],
    showimg: json["showimg"] == null ? "" : json["showimg"],
    metaTagTitle: json["meta_tag_title"] == null ? "" : json["meta_tag_title"],
    productcost: json["productcost"] == null ? "" : json["productcost"],
    tax: json["tax"] == null ? "" : json["tax"],
    taxvalue: json["taxvalue"] == null ? "" : json["taxvalue"],
    totalcost: json["totalcost"] == null ? "" : json["totalcost"],
    requiredshipping: json["requiredshipping"] == null ? "" : json["requiredshipping"],
    width: json["Width"] == null ? "" : json["Width"],
    height: json["Height"] == null ? "" : json["Height"],
    length: json["Length"] == null ? "" : json["Length"],
    weight: json["Weight"] == null ? "" : json["Weight"],
    minimumkg: json["minimumkg"] == null ? "" : json["minimumkg"],
    isActive: json["is_active"] == null ? "" : json["is_active"],
    images: List<String>.from(json["images"].map((x) => x)).isEmpty ? [] : List<String>.from(json["images"].map((x) => x)),
    feature: json["feature"] == null ? "" : json["feature"],
    todaydeals: json["todaydeals"] == null ? "" : json["todaydeals"],
    relatedProducts: json["related_products"] == null ? "" : json["related_products"],
    topProduct: json["top_product"] == null ? "" : json["top_product"],
    createdBy: json["created_by"] == null ? "" : json["created_by"],
    modifiedBy: json["modified_by"] == null ? "" : json["modified_by"],
    createdDate: json["created_date"] == null ? "" : json["created_date"],
    modifiedDate: json["modified_date"] == null ? "" : json["modified_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id.isEmpty ? "" : id,
    "productname": productname.isEmpty ? "" : productname,
    "sku": sku.isEmpty ? "" : sku,
    "productslug": productslug.isEmpty ? "" : productslug,
    "full_text": fullText.isEmpty ? "" : fullText,
    "category": category.isEmpty ? "" : category,
    "upc": upc,
    "quantity": quantity.isEmpty ? "" : quantity,
    "OutofStockStatus": outofStockStatus.isEmpty ? "" : outofStockStatus,
    "dateavailable": dateavailable,
    "sortorder": sortorder,
    "brand_id": brandId,
    "variants_values": variantsValues.isEmpty ? "" : variantsValues,
    "meta_tag_Keyword": metaTagKeyword.isEmpty ? "" : metaTagKeyword,
    "meta_tag_description": metaTagDescription.isEmpty ? "" : metaTagDescription,
    "showimg": showimg.isEmpty ? "" : showimg,
    "meta_tag_title": metaTagTitle.isEmpty ? "" : metaTagTitle,
    "productcost": productcost.isEmpty ? "" : productcost,
    "tax": tax.isEmpty ? "" : tax,
    "taxvalue": taxvalue.isEmpty ? "" : taxvalue,
    "totalcost": totalcost.isEmpty ? "" : totalcost,
    "requiredshipping": requiredshipping.isEmpty ? "" : requiredshipping,
    "Width": width.isEmpty ? "" : width,
    "Height": height.isEmpty ? "" : height,
    "Length": length.isEmpty ? "" : length,
    "Weight": weight.isEmpty ? "" : weight,
    "minimumkg": minimumkg.isEmpty ? "" : minimumkg,
    "is_active": isActive.isEmpty ? "" : isActive,
    "images": List<dynamic>.from(images.map((x) => x)).isEmpty ? [] : List<dynamic>.from(images.map((x) => x)),
    "feature": feature.isEmpty ? "" : feature,
    "todaydeals": todaydeals.isEmpty ? "" : todaydeals,
    "related_products": relatedProducts.isEmpty ? "" : relatedProducts,
    "top_product": topProduct,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "created_date": createdDate,
    "modified_date": modifiedDate,
  };
}*/

import 'dart:convert';

ProductDetailsData productDetailsDataFromJson(String str) => ProductDetailsData.fromJson(json.decode(str));

String productDetailsDataToJson(ProductDetailsData data) => json.encode(data.toJson());

class ProductDetailsData {
  ProductDetailsData({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) => ProductDetailsData(
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
    required this.id,
    required this.productname,
    required this.sku,
    required this.productslug,
    required this.fullText,
    required this.category,
    required this.upc,
    required this.quantity,
    required this.outofStockStatus,
    required this.dateavailable,
    required this.sortorder,
    required this.brandId,
    required this.variantsValues,
    required this.metaTagKeyword,
    required this.metaTagDescription,
    required this.showimg,
    required this.metaTagTitle,
    required this.productcost,
    required this.tax,
    required this.taxvalue,
    required this.totalcost,
    required this.requiredshipping,
    required this.width,
    required this.height,
    required this.length,
    required this.weight,
    required this.minimumkg,
    required this.isActive,
    required this.images,
    required this.feature,
    required this.todaydeals,
    required this.relatedProducts,
    required this.topProduct,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
  });

  int id;
  String productname;
  String sku;
  String productslug;
  String fullText;
  String category;
  String upc;
  int quantity;
  String outofStockStatus;
  String dateavailable;
  String sortorder;
  String brandId;
  String variantsValues;
  String metaTagKeyword;
  String metaTagDescription;
  String showimg;
  String metaTagTitle;
  String productcost;
  String tax;
  String taxvalue;
  String totalcost;
  String requiredshipping;
  String width;
  String height;
  String length;
  String weight;
  int minimumkg;
  String isActive;
  List<String> images;
  int feature;
  int todaydeals;
  String relatedProducts;
  String topProduct;
  String createdBy;
  String modifiedBy;
  DateTime createdDate;
  String modifiedDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    productname: json["productname"] == null ? "" : json["productname"],
    sku: json["sku"] == null ? "" : json["sku"],
    productslug: json["productslug"] == null ? "" : json["productslug"],
    fullText: json["full_text"] == null ? "" : json["full_text"],
    category: json["category"] == null ? "" : json["category"],
    upc: json["upc"] == null ? "" : json["upc"],
    quantity: json["quantity"] == null ? 0 : json["quantity"],
    outofStockStatus: json["OutofStockStatus"] == null ? "" : json["OutofStockStatus"],
    dateavailable: json["dateavailable"] == null ? "" : json["dateavailable"],
    sortorder: json["sortorder"] == null ? "" : json["sortorder"],
    brandId: json["brand_id"] == null ? "" : json["brand_id"],
    variantsValues: json["variants_values"] == null ? "" : json["variants_values"],
    metaTagKeyword: json["meta_tag_Keyword"] == null ? "" : json["meta_tag_Keyword"],
    metaTagDescription: json["meta_tag_description"] == null ? "" : json["meta_tag_description"],
    showimg: json["showimg"] == null ? "" : json["showimg"],
    metaTagTitle: json["meta_tag_title"] == null ? "" : json["meta_tag_title"],
    productcost: json["productcost"] == null ? "" : json["productcost"],
    tax: json["tax"] == null ? "" : json["tax"],
    taxvalue: json["taxvalue"] == null ? "" : json["taxvalue"],
    totalcost: json["totalcost"] == null ? "" : json["totalcost"],
    requiredshipping: json["requiredshipping"] == null ? "" : json["requiredshipping"],
    width: json["Width"] == null ? "" : json["Width"],
    height: json["Height"] == null ? "" : json["Height"],
    length: json["Length"] == null ? "" : json["Length"],
    weight: json["Weight"] == null ? "" : json["Weight"],
    minimumkg: json["minimumkg"] == null ? 1 : json["minimumkg"],
    isActive: json["is_active"] == null ? "" : json["is_active"],
    images: List<String>.from(json["images"].map((x) => x)).isEmpty ? [] : List<String>.from(json["images"].map((x) => x)),
    feature: json["feature"] == null ? 1 : json["feature"],
    todaydeals: json["todaydeals"] == null ? 0 : json["todaydeals"],
    relatedProducts: json["related_products"] == null ? "" : json["related_products"],
    topProduct: json["top_product"] == null ? "" : json["top_product"],
    createdBy: json["created_by"] == null ? "" : json["created_by"],
    modifiedBy: json["modified_by"] == null ? "" : json["modified_by"],
    createdDate: DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? "" : json["modified_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productname": productname.isEmpty ? "" : productname,
    "sku": sku.isEmpty ? "" : sku,
    "productslug": productslug.isEmpty ? "" : productslug,
    "full_text": fullText.isEmpty ? "" : fullText,
    "category": category.isEmpty ? "" : category,
    "upc": upc.isEmpty ? "" : upc,
    "quantity": quantity.toString().isEmpty ? 0 : quantity,
    "OutofStockStatus": outofStockStatus.isEmpty ? "" : outofStockStatus,
    "dateavailable": dateavailable.isEmpty ? "" : dateavailable,
    "sortorder": sortorder.isEmpty ? "" : sortorder,
    "brand_id": brandId.isEmpty ? "" : brandId,
    "variants_values": variantsValues.isEmpty ? "" : variantsValues,
    "meta_tag_Keyword": metaTagKeyword.isEmpty ? "" : metaTagKeyword,
    "meta_tag_description": metaTagDescription.isEmpty ? "" : metaTagDescription,
    "showimg": showimg.isEmpty ? "" : showimg,
    "meta_tag_title": metaTagTitle.isEmpty ? "" : metaTagTitle,
    "productcost": productcost.isEmpty ? "" : productcost,
    "tax": tax.isEmpty ? "" : tax,
    "taxvalue": taxvalue.isEmpty ? "" : taxvalue,
    "totalcost": totalcost.isEmpty ? "" : totalcost,
    "requiredshipping": requiredshipping.isEmpty ? "" : requiredshipping,
    "Width": width.isEmpty ? "" : width,
    "Height": height.isEmpty ? "" : height,
    "Length": length.isEmpty ? "" : length,
    "Weight": weight.isEmpty ? "" : weight,
    "minimumkg": minimumkg.toString().isEmpty ? 1 : minimumkg,
    "is_active": isActive.isEmpty ? "" : isActive,
    "images": List<dynamic>.from(images.map((x) => x)).isEmpty ? [] : List<dynamic>.from(images.map((x) => x)),
    "feature": feature.toString().isEmpty ? 1 : feature,
    "todaydeals": todaydeals.toString().isEmpty ? 0 : todaydeals,
    "related_products": relatedProducts.isEmpty ? "" : relatedProducts,
    "top_product": topProduct.isEmpty ? "" : topProduct,
    "created_by": createdBy.isEmpty ? "" : createdBy,
    "modified_by": modifiedBy.isEmpty ? "" : modifiedBy,
    "created_date": createdDate.toIso8601String(),
    "modified_date": modifiedDate.isEmpty ? "" : modifiedDate,
  };
}
