class ProductsDetail {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateModified;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  String? taxStatus;
  bool? manageStock;
  int? stockQuantity;
  bool? backordersAllowed;
  bool? backordered;
  bool? soldIndividually;
  bool? shippingRequired;
  bool? shippingTaxable;
  bool? reviewsAllowed;
  double? averageRating;
  int? ratingCount;
  List<Category>? categories;
  List<ImageData>? images;
  List<Attribute>? attributes;
  List<DefaultAttribute>? defaultAttributes;
  List<int>? variations;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaData>? metaData;
  String? stockStatus;
  bool? hasOptions;

  ProductsDetail({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateModified,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.taxStatus,
    this.manageStock,
    this.stockQuantity,
    this.backordersAllowed,
    this.backordered,
    this.soldIndividually,
    this.shippingRequired,
    this.shippingTaxable,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.categories,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
  });

  factory ProductsDetail.fromJson(Map<String, dynamic> json) {
    return ProductsDetail(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      dateCreated: DateTime.parse(json['date_created']),
      dateModified: DateTime.parse(json['date_modified']),
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      catalogVisibility: json['catalog_visibility'],
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      onSale: json['on_sale'],
      purchasable: json['purchasable'],
      totalSales: json['total_sales'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      taxStatus: json['tax_status'],
      manageStock: json['manage_stock'],
      stockQuantity: json['stock_quantity'],
      backordersAllowed: json['backorders_allowed'],
      backordered: json['backordered'],
      soldIndividually: json['sold_individually'],
      shippingRequired: json['shipping_required'],
      shippingTaxable: json['shipping_taxable'],
      reviewsAllowed: json['reviews_allowed'],
      averageRating: double.parse(json['average_rating']),
      ratingCount: json['rating_count'],
      categories: (json['categories'] as List)
          .map((category) => Category.fromJson(category))
          .toList(),
      images: (json['images'] as List)
          .map((image) => ImageData.fromJson(image))
          .toList(),
      attributes: (json['attributes'] as List)
          .map((attr) => Attribute.fromJson(attr))
          .toList(),
      defaultAttributes: (json['default_attributes'] as List)
          .map((attr) => DefaultAttribute.fromJson(attr))
          .toList(),
      variations: (json['variations'] as List).cast<int>(),
      priceHtml: json['price_html'],
      relatedIds: (json['related_ids'] as List).cast<int>(),
      metaData: (json['meta_data'] as List)
          .map((meta) => MetaData.fromJson(meta))
          .toList(),
      stockStatus: json['stock_status'],
      hasOptions: json['has_options'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'permalink': permalink,
      'date_created': dateCreated?.toIso8601String(),
      'date_modified': dateModified?.toIso8601String(),
      'type': type,
      'status': status,
      'featured': featured,
      'catalog_visibility': catalogVisibility,
      'description': description,
      'short_description': shortDescription,
      'sku': sku,
      'price': price,
      'regularPrice': regularPrice,
      'on_sale': onSale,
      'purchasable': purchasable,
      'total_sales': totalSales,
      'virtual': virtual,
      'downloadable': downloadable,
      'tax_status': taxStatus,
      'manage_stock': manageStock,
      'stock_quantity': stockQuantity,
      'backorders_allowed': backordersAllowed,
      'backordered': backordered,
      'sold_individually': soldIndividually,
      'shipping_required': shippingRequired,
      'shipping_taxable': shippingTaxable,
      'reviews_allowed': reviewsAllowed,
      'average_rating': averageRating,
      'rating_count': ratingCount,
      'categories': categories?.map((cat) => cat.toJson()).toList(),
      'images': images?.map((img) => img.toJson()).toList(),
      'attributes': attributes?.map((attr) => attr.toJson()).toList(),
      'default_attributes':
      defaultAttributes?.map((attr) => attr.toJson()).toList(),
      'variations': variations,
      'price_html': priceHtml,
      'related_ids': relatedIds,
      'meta_data': metaData?.map((meta) => meta.toJson()).toList(),
      'stock_status': stockStatus,
      'has_options': hasOptions,
    };
  }
}

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }
}

class ImageData {
  int? id;
  String? src;

  ImageData({this.id, this.src});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      src: json['src'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'src': src,
    };
  }
}

class Attribute {
  int? id;
  String? name;
  List<String>? options;

  Attribute({this.id, this.name, this.options});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      options: (json['options'] as List).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'options': options,
    };
  }
}

class DefaultAttribute {
  int? id;
  String? name;
  String? option;

  DefaultAttribute({this.id, this.name, this.option});

  factory DefaultAttribute.fromJson(Map<String, dynamic> json) {
    return DefaultAttribute(
      id: json['id'],
      name: json['name'],
      option: json['option'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'option': option,
    };
  }
}

class MetaData {
  int? id;
  String? key;
  String? value;

  MetaData({this.id, this.key, this.value});

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      id: json['id'],
      key: json['key'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'value': value,
    };
  }
}
