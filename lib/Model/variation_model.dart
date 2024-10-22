class ProductVariation {
  int? id;
  String? type;
  DateTime? dateCreated;
  DateTime? dateModified;
  String? description;
  String? permalink;
  String? sku;
  String? globalUniqueId;
  String? price;
  String? regularPrice;
  String? salePrice;
  bool? onSale;
  String? status;
  bool? purchasable;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? taxStatus;
  String? taxClass;
  String? manageStock;
  int? stockQuantity;
  String? stockStatus;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  String? weight;
  Dimensions? dimensions;
  String? shippingClass;
  int? shippingClassId;
  ProductImage? image;
  List<Attribute>? attributes;
  int? menuOrder;
  List<dynamic>? metaData;
  String? name;
  int? parentId;

  ProductVariation({
    this.id,
    this.type,
    this.dateCreated,
    this.dateModified,
    this.description,
    this.permalink,
    this.sku,
    this.globalUniqueId,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.status,
    this.purchasable,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.stockStatus,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.weight,
    this.dimensions,
    this.shippingClass,
    this.shippingClassId,
    this.image,
    this.attributes,
    this.menuOrder,
    this.metaData,
    this.name,
    this.parentId,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      id: json['id'],
      type: json['type'],
      dateCreated: json['date_created'] != null ? DateTime.parse(json['date_created']) : null,
      dateModified: json['date_modified'] != null ? DateTime.parse(json['date_modified']) : null,
      description: json['description'],
      permalink: json['permalink'],
      sku: json['sku'],
      globalUniqueId: json['global_unique_id'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      onSale: json['on_sale'],
      status: json['status'],
      purchasable: json['purchasable'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      downloads: json['downloads'] != null ? List<dynamic>.from(json['downloads']) : [],
      downloadLimit: json['download_limit'],
      downloadExpiry: json['download_expiry'],
      taxStatus: json['tax_status'],
      taxClass: json['tax_class'],
      manageStock: json['manage_stock'],
      stockQuantity: json['stock_quantity'],
      stockStatus: json['stock_status'],
      backorders: json['backorders'],
      backordersAllowed: json['backorders_allowed'],
      backordered: json['backordered'],
      lowStockAmount: json['low_stock_amount'],
      weight: json['weight'],
      dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null,
      shippingClass: json['shipping_class'],
      shippingClassId: json['shipping_class_id'],
      image: json['image'] != null ? ProductImage.fromJson(json['image']) : null,
      attributes: json['attributes'] != null
          ? (json['attributes'] as List).map((i) => Attribute.fromJson(i)).toList()
          : [],
      menuOrder: json['menu_order'],
      metaData: json['meta_data'] != null ? List<dynamic>.from(json['meta_data']) : [],
      name: json['name'],
      parentId: json['parent_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'date_created': dateCreated?.toIso8601String(),
      'date_modified': dateModified?.toIso8601String(),
      'description': description,
      'permalink': permalink,
      'sku': sku,
      'global_unique_id': globalUniqueId,
      'price': price,
      'regular_price': regularPrice,
      'sale_price': salePrice,
      'on_sale': onSale,
      'status': status,
      'purchasable': purchasable,
      'virtual': virtual,
      'downloadable': downloadable,
      'downloads': downloads,
      'download_limit': downloadLimit,
      'download_expiry': downloadExpiry,
      'tax_status': taxStatus,
      'tax_class': taxClass,
      'manage_stock': manageStock,
      'stock_quantity': stockQuantity,
      'stock_status': stockStatus,
      'backorders': backorders,
      'backorders_allowed': backordersAllowed,
      'backordered': backordered,
      'low_stock_amount': lowStockAmount,
      'weight': weight,
      'dimensions': dimensions?.toJson(),
      'shipping_class': shippingClass,
      'shipping_class_id': shippingClassId,
      'image': image?.toJson(),
      'attributes': attributes?.map((i) => i.toJson()).toList(),
      'menu_order': menuOrder,
      'meta_data': metaData,
      'name': name,
      'parent_id': parentId,
    };
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      length: json['length'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'width': width,
      'height': height,
    };
  }
}

class ProductImage {
  int? id;
  DateTime? dateCreated;
  DateTime? dateModified;
  String? src;
  String? name;
  String? alt;

  ProductImage({
    this.id,
    this.dateCreated,
    this.dateModified,
    this.src,
    this.name,
    this.alt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      dateCreated: json['date_created'] != null ? DateTime.parse(json['date_created']) : null,
      dateModified: json['date_modified'] != null ? DateTime.parse(json['date_modified']) : null,
      src: json['src'],
      name: json['name'],
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_created': dateCreated?.toIso8601String(),
      'date_modified': dateModified?.toIso8601String(),
      'src': src,
      'name': name,
      'alt': alt,
    };
  }
}

class Attribute {
  int? id;
  String? name;
  String? slug;
  String? option;

  Attribute({
    this.id,
    this.name,
    this.slug,
    this.option,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      option: json['option'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'option': option,
    };
  }
}
