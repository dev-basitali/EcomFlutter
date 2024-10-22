import 'package:flutter/material.dart';


import '../Model/category_model.dart';
import '../Model/category_service.dart';
import '../Model/product_service.dart';
import '../Model/products_model.dart';
import '../Model/reviews_model.dart';
import '../Model/reviews_service.dart';

class DataProvider extends ChangeNotifier {
  final CategoryService categoryService = CategoryService();
  final ReviewsService reviewService = ReviewsService();
  final ProductsModel productService = ProductsModel();

  List<CategoryModel> parentCategories = [];
  List<ProductReview> reviews = [];
  List<ProductsDetail> products = [];
  bool isLoading = true;

  DataProvider() {
    // Initialize data fetching
    fetchCategories();
    fetchProductReviews(1);
    fetchProducts(1);
  }

  // Fetch parent categories
  Future<void> fetchCategories() async {
    List<CategoryModel> allCategories = await categoryService.getCategories();
    parentCategories =
        allCategories.where((category) => category.parent == 0).toList();
    isLoading = false;
    notifyListeners(); // Notify listeners when data is updated
  }

  // Fetch product reviews based on product ID
  Future<void> fetchProductReviews(int productId) async {
    reviews = await reviewService.getReviews(productId);
    isLoading = false;
    notifyListeners(); // Notify listeners when data is updated
  }

  // Fetch products based on category ID
  Future<void> fetchProducts(int categoryId) async {
    List<ProductsDetail> allProducts = await productService.getProducts();
    products = allProducts
        .where((product) => product.categories![0].id == categoryId)
        .toList();
    isLoading = false;
    notifyListeners(); // Notify listeners when data is updated
  }
}
