class CategoryModel {
  final int? id;
  final String? name;
  final String? slug;
  final int? parent;
  final String? description;
  final String? display;
  final String? image;
  final int? menuOrder;
  final int? count;
  final Links? links;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.links,
  });

  // Factory constructor to create a Category object from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      parent: json['parent'],
      description: json['description'],
      display: json['display'],
      image: json['image'],
      menuOrder: json['menu_order'],
      count: json['count'],
      links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }

  // Method to convert the Category object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'parent': parent,
      'description': description,
      'display': display,
      'image': image,
      'menu_order': menuOrder,
      'count': count,
      '_links': links?.toJson(),
    };
  }
}

class Links {
  final List<LinkItem>? self;
  final List<LinkItem>? collection;
  final List<LinkItem>? up;

  Links({
    this.self,
    this.collection,
    this.up,
  });

  // Factory constructor to create Links from JSON
  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] != null
          ? List<LinkItem>.from(json['self'].map((item) => LinkItem.fromJson(item)))
          : null,
      collection: json['collection'] != null
          ? List<LinkItem>.from(json['collection'].map((item) => LinkItem.fromJson(item)))
          : null,
      up: json['up'] != null
          ? List<LinkItem>.from(json['up'].map((item) => LinkItem.fromJson(item)))
          : null,
    );
  }

  // Method to convert Links object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'self': self?.map((item) => item.toJson()).toList(),
      'collection': collection?.map((item) => item.toJson()).toList(),
      'up': up?.map((item) => item.toJson()).toList(),
    };
  }
}

class LinkItem {
  final String? href;

  LinkItem({this.href});

  // Factory constructor to create LinkItem from JSON
  factory LinkItem.fromJson(Map<String, dynamic> json) {
    return LinkItem(href: json['href']);
  }

  // Method to convert LinkItem back to JSON
  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
