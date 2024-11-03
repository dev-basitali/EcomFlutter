import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';

class DataProvider extends ChangeNotifier {



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
    List<CategoryModel> allCategories = await WpServices.getCategories();
    parentCategories =
        allCategories.where((category) => category.parent == 0).toList();
    isLoading = false;
    notifyListeners(); // Notify listeners when data is updated
  }

  // Fetch product reviews based on product ID
  Future<void> fetchProductReviews(int productId) async {
    reviews = await WpServices.getReviews(productId);
    isLoading = false;
    notifyListeners(); // Notify listeners when data is updated
  }

  // Fetch products based on category ID
  Future<void> fetchProducts(int categoryId) async {
    List<ProductsDetail> allProducts = await WpServices.getProducts();
    products = allProducts
        .where((product) => product.categories![0].id == categoryId)
        .toList();
    isLoading = false;
    notifyListeners(); // Notify listeners when data is updated
  }
}
