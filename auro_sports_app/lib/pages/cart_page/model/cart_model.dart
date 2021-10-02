// To parse this JSON data, do
//
//     final userCartData = userCartDataFromJson(jsonString);

/*import 'dart:convert';

UserCartData userCartDataFromJson(String str) => UserCartData.fromJson(json.decode(str));

String userCartDataToJson(UserCartData data) => json.encode(data.toJson());

class UserCartData {
  UserCartData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory UserCartData.fromJson(Map<String, dynamic> json) => UserCartData(
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
    required this.cart,
    required this.cartditeil,
  });

  Cart cart;
  List<Cartditeil> cartditeil;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cart: Cart.fromJson(json["cart"]),
    cartditeil: List<Cartditeil>.from(json["cartditeil"].map((x) => Cartditeil.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
    "cartditeil": List<dynamic>.from(cartditeil.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    required this.cartId,
    required this.totalprice,
    required this.totalqty,
    this.couponid,
    this.coupontype,
    this.couponvalue,
    required this.userId,
    required this.createdDate,
    this.updatedDate,
  });

  String cartId;
  String totalprice;
  String totalqty;
  dynamic couponid;
  dynamic coupontype;
  dynamic couponvalue;
  String userId;
  // DateTime createdDate;
  String createdDate;
  dynamic updatedDate;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cartId"] == null ? "" : json["cartId"],
    totalprice: json["totalprice"] == null ? "" : json["totalprice"],
    totalqty: json["totalqty"] == null ? "" : json["totalqty"],
    couponid: json["couponid"] == null ? "" : json["couponid"],
    coupontype: json["coupontype"] == null ? "" : json["coupontype"],
    couponvalue: json["couponvalue"] == null ? "" : json["couponvalue"],
    userId: json["userId"] == null ? "" : json["userId"],
    createdDate: json["created_date"] == null ? "" : json["created_date"],
    updatedDate: json["updated_date"] == null ? "" : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId.isEmpty ? "" : cartId,
    "totalprice": totalprice.isEmpty ? "" : totalprice,
    "totalqty": totalqty.isEmpty ? "" : totalqty,
    "couponid": couponid,
    "coupontype": coupontype,
    "couponvalue": couponvalue,
    "userId": userId.isEmpty ? "" : userId,
    // "created_date": createdDate.toIso8601String(),
    "created_date": createdDate.toString().isEmpty ? "" : createdDate.toString(),
    "updated_date": updatedDate,
  };
}

class Cartditeil {
  Cartditeil({
    required this.cartDetailId,
    required this.cartId,
    required this.productId,
    this.variyantid,
    required this.productKg,
    required this.quantity,
    required this.createdDate,
    this.updatedDate,
    required this.id,
    this.name,
    this.type,
    this.sortOrder,
    this.valueNameNSortOrder,
    this.createdBy,
    this.updatedBy,
    required this.productname,
    required this.sku,
    required this.productslug,
    required this.fullText,
    required this.category,
    this.upc,
    required this.outofStockStatus,
    this.dateavailable,
    this.sortorder,
    this.brandId,
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
    this.topProduct,
    this.modifiedBy,
    this.modifiedDate,
    required this.cquantity,
  });

  String cartDetailId;
  String cartId;
  String productId;
  dynamic variyantid;
  String productKg;
  String quantity;
  // DateTime createdDate;
  String createdDate;
  dynamic updatedDate;
  String id;
  dynamic name;
  dynamic type;
  dynamic sortOrder;
  dynamic valueNameNSortOrder;
  dynamic createdBy;
  dynamic updatedBy;
  String productname;
  String sku;
  String productslug;
  String fullText;
  String category;
  dynamic upc;
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
  int totalcost;
  String requiredshipping;
  String width;
  String height;
  String length;
  String weight;
  String minimumkg;
  String isActive;
  String images;
  String feature;
  String todaydeals;
  String relatedProducts;
  dynamic topProduct;
  dynamic modifiedBy;
  dynamic modifiedDate;
  String cquantity;

  factory Cartditeil.fromJson(Map<String, dynamic> json) => Cartditeil(
    cartDetailId: json["cartDetailId"] == null ? "" : json["cartDetailId"],
    cartId: json["cartId"] == null ? "" : json["cartId"],
    productId: json["productId"] == null ? "" : json["productId"],
    variyantid: json["variyantid"],
    productKg: json["product_kg"] == null ? "" : json["product_kg"],
    quantity: json["quantity"] == null ? "" : json["quantity"],
    createdDate: json["created_date"] == null ? "" : json["created_date"],
    updatedDate: json["updated_date"],
    id: json["id"] == null ? "" : json["id"],
    name: json["name"],
    type: json["type"],
    sortOrder: json["sort_order"],
    valueNameNSortOrder: json["value_name_n_sort_order"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    productname: json["productname"] == null ? "" : json["productname"],
    sku: json["sku"] == null ? "" : json["sku"],
    productslug: json["productslug"] == null ? "" : json["productslug"],
    fullText: json["full_text"] == null ? "" : json["full_text"],
    category: json["category"] == null ? "" : json["category"],
    upc: json["upc"],
    outofStockStatus: json["OutofStockStatus"] == null ? "" : json["OutofStockStatus"],
    dateavailable: json["dateavailable"],
    sortorder: json["sortorder"],
    brandId: json["brand_id"],
    variantsValues: json["variants_values"] == null ? "" : json["variants_values"],
    metaTagKeyword: json["meta_tag_Keyword"] == null ? "" : json["meta_tag_Keyword"],
    metaTagDescription: json["meta_tag_description"] == null ? "" : json["meta_tag_description"],
    showimg: json["showimg"] == null ? "" : json["showimg"],
    metaTagTitle: json["meta_tag_title"] == null ? "" : json["meta_tag_title"],
    productcost: json["productcost"] == null ? "" : json["productcost"],
    tax: json["tax"] == null ? "" : json["tax"],
    taxvalue: json["taxvalue"] == null ? "" : json["taxvalue"],
    totalcost: json["totalcost"],
    requiredshipping: json["requiredshipping"] == null ? "" : json["requiredshipping"],
    width: json["Width"] == null ? "" : json["Width"],
    height: json["Height"] == null ? "" : json["Height"],
    length: json["Length"] == null ? "" : json["Length"],
    weight: json["Weight"] == null ? "" : json["Weight"],
    minimumkg: json["minimumkg"] == null ? "" : json["minimumkg"],
    isActive: json["is_active"] == null ? "" : json["is_active"],
    images: json["images"] == null ? "" : json["images"],
    feature: json["feature"] == null ? "" : json["feature"],
    todaydeals: json["todaydeals"] == null ? "" : json["todaydeals"],
    relatedProducts: json["related_products"] == null ? "" : json["related_products"],
    topProduct: json["top_product"],
    modifiedBy: json["modified_by"],
    modifiedDate: json["modified_date"],
    cquantity: json["cquantity"] == null ? "" : json["cquantity"],
  );

  Map<String, dynamic> toJson() => {
    "cartDetailId": cartDetailId.isEmpty ? "" : cartDetailId,
    "cartId": cartId.isEmpty ? "" : cartId,
    "productId": productId.isEmpty ? "" : productId,
    "variyantid": variyantid,
    "product_kg": productKg.isEmpty ? "" : productKg,
    "quantity": quantity.isEmpty ? "" : quantity,
    // "created_date": createdDate == null ? "" : createdDate.toIso8601String(),
    "created_date": createdDate.isEmpty ? "" : createdDate.toString(),
    "updated_date": updatedDate,
    "id": id.isEmpty ? "" : id,
    "name": name,
    "type": type,
    "sort_order": sortOrder,
    "value_name_n_sort_order": valueNameNSortOrder,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "productname": productname.isEmpty ? "" : productname,
    "sku": sku.isEmpty ? "" : sku,
    "productslug": productslug.isEmpty ? "" : productslug,
    "full_text": fullText.isEmpty ? "" : fullText,
    "category": category.isEmpty ? "" : category,
    "upc": upc,
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
    "totalcost": totalcost,
    "requiredshipping": requiredshipping.isEmpty ? "" : requiredshipping,
    "Width": width.isEmpty ? "" : width,
    "Height": height.isEmpty ? "" : height,
    "Length": length.isEmpty ? "" : length,
    "Weight": weight.isEmpty ? "" : weight,
    "minimumkg": minimumkg.isEmpty ? "" : minimumkg,
    "is_active": isActive.isEmpty ? "" : isActive,
    "images": images.isEmpty ? "" : images,
    "feature": feature.isEmpty ? "" : feature,
    "todaydeals": *//*todaydeals == *//*todaydeals.isEmpty ? "" : todaydeals,
    "related_products": relatedProducts.isEmpty ? "" : relatedProducts,
    "top_product": topProduct,
    "modified_by": modifiedBy,
    "modified_date": modifiedDate,
    "cquantity": cquantity.isEmpty ? "" : cquantity,
  };
}*/


// To parse this JSON data, do
//
//     final userCartData = userCartDataFromJson(jsonString);

import 'dart:convert';

UserCartData userCartDataFromJson(String str) => UserCartData.fromJson(json.decode(str));

String userCartDataToJson(UserCartData data) => json.encode(data.toJson());

class UserCartData {
  UserCartData({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory UserCartData.fromJson(Map<String, dynamic> json) => UserCartData(
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
    required this.cart,
    required this.cartditeil,
  });

  Cart cart;
  List<Cartditeil> cartditeil;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cart: Cart.fromJson(json["cart"]),
    cartditeil: List<Cartditeil>.from(json["cartditeil"].map((x) => Cartditeil.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
    "cartditeil": List<dynamic>.from(cartditeil.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    required this.cartId,
    required this.totalprice,
    required this.totalqty,
    required this.couponid,
    required this.coupontype,
    required this.couponvalue,
    required this.userId,
    required this.createdDate,
    required this.updatedDate,
  });

  int cartId;
  int totalprice;
  int totalqty;
  String couponid;
  String coupontype;
  String couponvalue;
  String userId;
  DateTime createdDate;
  String updatedDate;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cartId"],
    totalprice: json["totalprice"] == null ? 0 : json["totalprice"],
    totalqty: json["totalqty"] == null ? 0 : json["totalqty"],
    couponid: json["couponid"] == null ? "" : json["couponid"],
    coupontype: json["coupontype"] == null ? "" : json["coupontype"],
    couponvalue: json["couponvalue"] == null ? "" : json["couponvalue"],
    userId: json["userId"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"] == null ? "" : json["updated_date"],
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId,
    "totalprice": totalprice.toString().isEmpty ? 0 : totalprice,
    "totalqty": totalqty.toString().isEmpty ? 0 : totalqty,
    "couponid": couponid.isEmpty ? "" : couponid,
    "coupontype": coupontype.isEmpty ? "" : coupontype,
    "couponvalue": couponvalue.isEmpty ? "" : couponvalue,
    "userId": userId.isEmpty ? "" : userId,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.isEmpty ? "" : updatedDate,
  };
}

class Cartditeil {
  Cartditeil({
    required this.cartDetailId,
    required this.cartId,
    required this.productId,
    required this.variyantid,
    required this.productKg,
    required this.quantity,
    required this.createdDate,
    required this.updatedDate,
    required this.id,
    required this.name,
    required this.type,
    required this.sortOrder,
    required this.valueNameNSortOrder,
    required this.createdBy,
    required this.updatedBy,
    required this.productname,
    required this.sku,
    required this.productslug,
    required this.fullText,
    required this.category,
    required this.upc,
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
    required this.modifiedBy,
    required this.modifiedDate,
    required this.cquantity,
  });

  int cartDetailId;
  int cartId;
  String productId;
  String variyantid;
  int productKg;
  int quantity;
  DateTime createdDate;
  String updatedDate;
  int id;
  String name;
  String type;
  String sortOrder;
  String valueNameNSortOrder;
  String createdBy;
  String updatedBy;
  String productname;
  String sku;
  String productslug;
  String fullText;
  String category;
  String upc;
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
  int totalcost;
  String requiredshipping;
  String width;
  String height;
  String length;
  String weight;
  int minimumkg;
  String isActive;
  String images;
  int feature;
  int todaydeals;
  String relatedProducts;
  String topProduct;
  String modifiedBy;
  String modifiedDate;
  int cquantity;

  factory Cartditeil.fromJson(Map<String, dynamic> json) => Cartditeil(
    cartDetailId: json["cartDetailId"],
    cartId: json["cartId"],
    productId: json["productId"] == null ? "" : json["productId"],
    variyantid: json["variyantid"] == null ? "" : json["variyantid"],
    productKg: json["product_kg"] == null ? 0 : json["product_kg"],
    quantity: json["quantity"] == null ? 1 : json["quantity"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"] == null ? "" : json["updated_date"],
    id: json["id"],
    name: json["name"] == null ? "" : json["name"],
    type: json["type"] == null ? "" : json["type"],
    sortOrder: json["sort_order"] == null ? "" : json["sort_order"],
    valueNameNSortOrder: json["value_name_n_sort_order"] == null ? "" : json["value_name_n_sort_order"],
    createdBy: json["created_by"] == null ? "" : json["created_by"],
    updatedBy: json["updated_by"] == null ? "" : json["updated_by"],
    productname: json["productname"] == null ? "" : json["productname"],
    sku: json["sku"] == null ? "" : json["sku"],
    productslug: json["productslug"] == null ? "" : json["productslug"],
    fullText: json["full_text"] == null ? "" : json["full_text"],
    category: json["category"] == null ? "" : json["category"],
    upc: json["upc"] == null ? "" : json["upc"],
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
    totalcost: json["totalcost"] == null ? 0 : json["totalcost"],
    requiredshipping: json["requiredshipping"] == null ? "" : json["requiredshipping"],
    width: json["Width"] == null ? "" : json["Width"],
    height: json["Height"] == null ? "" : json["Height"],
    length: json["Length"] == null ? "" : json["Length"],
    weight: json["Weight"] == null ? "" : json["Weight"],
    minimumkg: json["minimumkg"] == null ? 1 : json["minimumkg"],
    isActive: json["is_active"] == null ? "" : json["is_active"],
    images: json["images"] == null ? "" : json["images"],
    feature: json["feature"] == null ? 1 : json["feature"],
    todaydeals: json["todaydeals"] == null ? 1 : json["todaydeals"],
    relatedProducts: json["related_products"] == null ? "" : json["related_products"],
    topProduct: json["top_product"] == null ? "" : json["top_product"],
    modifiedBy: json["modified_by"] == null ? "" : json["modified_by"],
    modifiedDate: json["modified_date"] == null ? "" : json["modified_date"],
    cquantity: json["cquantity"] == null ? 1 : json["cquantity"],
  );

  Map<String, dynamic> toJson() => {
    "cartDetailId": cartDetailId,
    "cartId": cartId,
    "productId": productId.isEmpty ? "" : productId,
    "variyantid": variyantid.isEmpty ? "" : variyantid,
    "product_kg": productKg.toString().isEmpty ? 0 : productKg,
    "quantity": quantity.toString().isEmpty ? 1 : quantity,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.isEmpty ? "" : updatedDate,
    "id": id,
    "name": name.isEmpty ? "" : name,
    "type": type.isEmpty ? "" : type,
    "sort_order": sortOrder.isEmpty ? "" : sortOrder,
    "value_name_n_sort_order": valueNameNSortOrder.isEmpty ? "" : valueNameNSortOrder,
    "created_by": createdBy.isEmpty ? "" : createdBy,
    "updated_by": updatedBy.isEmpty ? "" : updatedBy,
    "productname": productname.isEmpty ? "" : productname,
    "sku": sku.isEmpty ? "" : sku,
    "productslug": productslug.isEmpty ? "" : productslug,
    "full_text": fullText.isEmpty ? "" : fullText,
    "category": category.isEmpty ? "" : category,
    "upc": upc.isEmpty ? "" : upc,
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
    "totalcost": totalcost.toString().isEmpty ? 0 : totalcost,
    "requiredshipping": requiredshipping.isEmpty ? "" : requiredshipping,
    "Width": width.isEmpty ? "" : width,
    "Height": height.isEmpty ? "" : height,
    "Length": length.isEmpty ? "" : length,
    "Weight": weight.isEmpty ? "" : weight,
    "minimumkg": minimumkg.toString().isEmpty ? 1 : minimumkg,
    "is_active": isActive.isEmpty ? "" : isActive,
    "images": images.isEmpty ? "" : images,
    "feature": feature.toString().isEmpty ? 1 : feature,
    "todaydeals": todaydeals.toString().isEmpty ? 1 : todaydeals,
    "related_products": relatedProducts.isEmpty ? "" : relatedProducts,
    "top_product": topProduct.isEmpty ? "" : topProduct,
    "modified_by": modifiedBy.isEmpty ? "" : modifiedBy,
    "modified_date": modifiedDate.isEmpty ? "" : modifiedDate,
    "cquantity": cquantity.toString().isEmpty ? 1 : cquantity,
  };
}
