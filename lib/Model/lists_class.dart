import 'package:flutter/material.dart';

class StoreServices {
  final List<String> imageList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
  ];

  final List<StoreCategory> categoryList = [
    StoreCategory(imagePath: 'assets/Icons/wrist-watch.png', title: 'Watches'),
    StoreCategory(
        imagePath: 'assets/Icons/headphones.png', title: 'Headphones'),
    StoreCategory(imagePath: 'assets/Icons/perfume.png', title: 'perfumes'),
    StoreCategory(imagePath: 'assets/Icons/cosmetics.png', title: 'cosmetics'),
    StoreCategory(imagePath: 'assets/Icons/wrist-watch.png', title: 'Watches'),
    StoreCategory(
        imagePath: 'assets/Icons/headphones.png', title: 'Headphones'),
    StoreCategory(imagePath: 'assets/Icons/perfume.png', title: 'perfumes'),
    StoreCategory(imagePath: 'assets/Icons/cosmetics.png', title: 'cosmetics'),
  ];
  List<Product> products = [
    Product(
      imagePath: 'assets/images/headphones.jpg',  // Replace with real image path or URL
      productName: 'Wireless Headphones',
      price: 59.99,
      oldPrice: 89.99,
      rating: 4, id: 1,
    ),
    Product(
      imagePath: 'assets/images/watches.jpg',
      productName: 'Smart Watch',
      price: 149.99,
      oldPrice: 199.99,
      rating: 5, id: 2,
    ),
    Product(
      imagePath: 'assets/images/headphones.jpg',
      productName: 'Gaming Laptop',
      price: 999.99,
      oldPrice: 1299.99,
      rating: 4, id: 3,
    ),
    Product(
      imagePath: 'assets/images/watches.jpg',
      productName: 'Bluetooth Speaker',
      price: 39.99,
      rating: 3, id: 4,  // No old price, just rating
    ),
    Product(
      imagePath: 'assets/images/headphones.jpg',
      productName: '4K TV',
      price: 599.99,
      oldPrice: 799.99,
      rating: 5, id: 5,
    ),
  ];
  List<SaleProduct> saleProducts = [
    SaleProduct(
      id: '1',
      imagePath: 'assets/images/headphones.jpg',
      productName: 'Wireless Headphones',
      price: 59.99,
      salePercentage: 20, oldPrice: 80,
    ),
    SaleProduct(
      id: '2',
      imagePath: 'assets/images/watches.jpg',
      productName: 'Smart Watch',
      price: 149.99,
      salePercentage: 30, oldPrice: 200,
    ),
    SaleProduct(
      id: '3',
      imagePath: 'assets/images/headphones.jpg',
      productName: 'Gaming Laptop',
      price: 999.99,
      salePercentage: 15, oldPrice: 1500,
    ),
    SaleProduct(
      id: '4',
      imagePath: 'assets/images/watches.jpg',
      productName: 'Fitness Tracker',
      price: 39.99,
      salePercentage: 10, oldPrice: 50,
    ),
  ];

  List<TopDeals> topDeals = [
    TopDeals(
      id: '1',
      imagePath: 'assets/images/headphones.jpg',
      minPrice: 1000,
      maxPrice: 10000,
      noOfItems: 2,
    ),
    TopDeals(
      id: '2',
      imagePath: 'assets/images/watches.jpg',
      minPrice: 2999,
      maxPrice: 5999,
      noOfItems: 1,
    ),
    TopDeals(
      id: '3',
      imagePath: 'assets/images/headphones.jpg',
      minPrice: 499,
      maxPrice: 1499,
      noOfItems: 10,
    ),
    TopDeals(
      id: '4',
      imagePath: 'assets/images/watches.jpg',
      minPrice: 999,
      maxPrice: 3999,
      noOfItems: 5,
    ),
  ];
  final List<NewProduct> newProduct = [
    NewProduct(
      id: 12345689,
      name: 'Apple iPhone 15 Pro',
      oldPrice: 999.00,
      newPrice: 899.00,
      discountPercentage: 10,
      imageUrl: 'assets/images/mobile.png',
      ratingCount: 97,
    ),
    NewProduct(
      id: 98765432,
      name: 'Samsung Galaxy S23 Ultra',
      oldPrice: 1199.00,
      newPrice: 1099.00,
      discountPercentage: 8,
      imageUrl: 'assets/images/mobile.png',
      ratingCount: 85,
    ),
    NewProduct(
      id: 12345689,
      name: 'Apple iPhone 15 Pro',
      oldPrice: 999.00,
      newPrice: 899.00,
      discountPercentage: 10,
      imageUrl: 'assets/images/mobile.png',
      ratingCount: 97,
    ),
    NewProduct(
      id: 98765432,
      name: 'Samsung Galaxy S23 Ultra',
      oldPrice: 1199.00,
      newPrice: 1099.00,
      discountPercentage: 8,
      imageUrl: 'assets/images/mobile.png',
      ratingCount: 85,
    ),
    // Add more products as needed
  ];
}

class SaleProduct {
  final String id;
  final String imagePath;
  final String productName;
  final double price;
  final double oldPrice;
  final double salePercentage;

  SaleProduct({
    required this.id,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.salePercentage,
  });
}


class StoreCategory {
  final String imagePath;
  final String title;
  final String? description;
  final String? price;
  final IconButton? cartIcon;
  StoreCategory({
    required this.imagePath,
    required this.title,
    this.description,
    this.price,
    this.cartIcon,
  });
}

class Product {
  final String imagePath;
  final String productName;
  final double price;
  final double oldPrice;
  final int rating;
  final int id;

  Product( {
    required this.imagePath,
    required this.productName,
    required this.price,
    this.oldPrice = 0,  // Old price can be optional, set to 0 if there's no discount
    required this.rating,
    required this.id,
  });
}

class TopDeals {
  final String id;
  final String imagePath;
  final double minPrice;
  final double maxPrice;
  final double noOfItems;

  TopDeals({
    required this.id,
    required this.imagePath,
    required this.minPrice,
    required this.maxPrice,
    required this.noOfItems,
  });
}

// product_model.dart

class NewProduct {
  final int id;
  final String name;
  final double oldPrice;
  final double newPrice;
  final int discountPercentage;
  final String imageUrl;
  final int ratingCount;

  NewProduct({
    required this.id,
    required this.name,
    required this.oldPrice,
    required this.newPrice,
    required this.discountPercentage,
    required this.imageUrl,
    required this.ratingCount,
  });
}
