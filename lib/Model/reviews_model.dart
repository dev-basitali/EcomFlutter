class ProductReview {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  int? productId;
  String? productName;
  String? productPermalink;
  String? status;
  String? reviewer;
  String? reviewerEmail;
  String? review;
  int? rating;
  bool? verified;
  ReviewerAvatarUrls? reviewerAvatarUrls;
  ReviewLinks? links;

  ProductReview({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.productId,
    this.productName,
    this.productPermalink,
    this.status,
    this.reviewer,
    this.reviewerEmail,
    this.review,
    this.rating,
    this.verified,
    this.reviewerAvatarUrls,
    this.links,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) {
    return ProductReview(
      id: json['id'],
      dateCreated: json['date_created'],
      dateCreatedGmt: json['date_created_gmt'],
      productId: json['product_id'],
      productName: json['product_name'],
      productPermalink: json['product_permalink'],
      status: json['status'],
      reviewer: json['reviewer'],
      reviewerEmail: json['reviewer_email'],
      review: json['review'],
      rating: json['rating'],
      verified: json['verified'],
      reviewerAvatarUrls: json['reviewer_avatar_urls'] != null
          ? ReviewerAvatarUrls.fromJson(json['reviewer_avatar_urls'])
          : null,
      links: json['_links'] != null ? ReviewLinks.fromJson(json['_links']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_created': dateCreated,
      'date_created_gmt': dateCreatedGmt,
      'product_id': productId,
      'product_name': productName,
      'product_permalink': productPermalink,
      'status': status,
      'reviewer': reviewer,
      'reviewer_email': reviewerEmail,
      'review': review,
      'rating': rating,
      'verified': verified,
      'reviewer_avatar_urls': reviewerAvatarUrls?.toJson(),
      '_links': links?.toJson(),
    };
  }
}

class ReviewerAvatarUrls {
  String? size24;
  String? size48;
  String? size96;

  ReviewerAvatarUrls({this.size24, this.size48, this.size96});

  factory ReviewerAvatarUrls.fromJson(Map<String, dynamic> json) {
    return ReviewerAvatarUrls(
      size24: json['24'],
      size48: json['48'],
      size96: json['96'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '24': size24,
      '48': size48,
      '96': size96,
    };
  }
}

class ReviewLinks {
  List<Link>? self;
  List<Link>? collection;
  List<Link>? up;
  List<Link>? reviewer;

  ReviewLinks({this.self, this.collection, this.up, this.reviewer});

  factory ReviewLinks.fromJson(Map<String, dynamic> json) {
    return ReviewLinks(
      self: (json['self'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e))
          .toList(),
      collection: (json['collection'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e))
          .toList(),
      up: (json['up'] as List<dynamic>?)?.map((e) => Link.fromJson(e)).toList(),
      reviewer: (json['reviewer'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': self?.map((e) => e.toJson()).toList(),
      'collection': collection?.map((e) => e.toJson()).toList(),
      'up': up?.map((e) => e.toJson()).toList(),
      'reviewer': reviewer?.map((e) => e.toJson()).toList(),
    };
  }
}

class Link {
  String? href;

  Link({this.href});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
