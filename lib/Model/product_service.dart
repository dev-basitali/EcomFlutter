class ProductsDetail {
  final int? id;
  final String? name;
  final String? slug;
  final String? permalink;
  final DateTime? dateCreated;
  final DateTime? dateModified;
  final String? type;
  final String? status;
  final bool? featured;
  final String? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final bool? onSale;
  final bool? purchasable;
  final int? totalSales;
  final bool? virtual;
  final bool? downloadable;
  final List<dynamic>? downloads;
  final bool? manageStock;
  final int? stockQuantity;
  final String? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final bool? soldIndividually;
  final String? stockStatus;
  final Dimensions? dimensions;
  final bool? shippingRequired;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? averageRating;
  final int? ratingCount;
  final List<Category>? categories;
  final List<dynamic>? tags;
  final List<ImageData>? images;
  final List<int>? relatedIds;
  final List<MetaData>? metaData;

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
    this.salePrice,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.soldIndividually,
    this.stockStatus,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.categories,
    this.tags,
    this.images,
    this.relatedIds,
    this.metaData,
  });

  factory ProductsDetail.fromJson(Map<String, dynamic> json) {
    return ProductsDetail(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      dateCreated: json['date_created'] != null
          ? DateTime.parse(json['date_created'])
          : null,
      dateModified: json['date_modified'] != null
          ? DateTime.parse(json['date_modified'])
          : null,
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      catalogVisibility: json['catalog_visibility'],
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      onSale: json['on_sale'],
      purchasable: json['purchasable'],
      totalSales: json['total_sales'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      downloads: json['downloads'] != null
          ? List<dynamic>.from(json['downloads'])
          : null,
      manageStock: json['manage_stock'],
      stockQuantity: json['stock_quantity'],
      backorders: json['backorders'],
      backordersAllowed: json['backorders_allowed'],
      backordered: json['backordered'],
      soldIndividually: json['sold_individually'],
      stockStatus: json['stock_status'],
      dimensions: json['dimensions'] != null
          ? Dimensions.fromJson(json['dimensions'])
          : null,
      shippingRequired: json['shipping_required'],
      shippingTaxable: json['shipping_taxable'],
      shippingClass: json['shipping_class'],
      shippingClassId: json['shipping_class_id'],
      reviewsAllowed: json['reviews_allowed'],
      averageRating: json['average_rating'],
      ratingCount: json['rating_count'],
      categories: json['categories'] != null
          ? List<Category>.from(
          json['categories'].map((category) => Category.fromJson(category)))
          : null,
      tags: json['tags'] != null ? List<dynamic>.from(json['tags']) : null,
      images: json['images'] != null
          ? List<ImageData>.from(
          json['images'].map((image) => ImageData.fromJson(image)))
          : null,
      relatedIds: json['related_ids'] != null
          ? List<int>.from(json['related_ids'])
          : null,
      metaData: json['meta_data'] != null
          ? List<MetaData>.from(
          json['meta_data'].map((meta) => MetaData.fromJson(meta)))
          : null,
    );
  }
}

class Dimensions {
  final String? length;
  final String? width;
  final String? height;

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
}

class Category {
  final int? id;
  final String? name;
  final String? slug;

  Category({
    this.id,
    this.name,
    this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class ImageData {
  final int? id;
  final String src;
  final String? name;
  final String? alt;

  ImageData({
    this.id,
    required this.src,
    this.name,
    this.alt,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      src: json['src'],
      name: json['name'],
      alt: json['alt'],
    );
  }
}

class MetaData {
  final int? id;
  final String? key;
  final String? value;

  MetaData({
    this.id,
    this.key,
    this.value,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      id: json['id'],
      key: json['key'],
      value: json['value'],
    );
  }
}
