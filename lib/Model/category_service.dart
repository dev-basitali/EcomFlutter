import 'dart:convert';

import 'package:http/http.dart' as http;

import 'category_model.dart';

class CategoryService {
  List<CategoryModel> categories = [];
  Future<List<CategoryModel>> getCategories() async {
    const String baseUrl = 'https://192.168.100.5/ecomFlutter/wp-json/wc/v3/products/categories';
    const String consumerKey = 'ck_d3c2d1f8f9fad21b9418d65340693709d7a20390';
    const String consumerSecret = 'cs_8f4821b3ca6431aea2620ad610249bb2d21a32ba';

    try {
      final response = await http.get(
          Uri.parse('$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret'),
          headers: {
            'CCApp' : 'true'
          }
      );
      print("Response Status Code: ${response.statusCode}");
      var data = jsonDecode(response.body) as List;
      print("Data: $data");

      if (response.statusCode == 200) {
        categories = data.map((product) => CategoryModel.fromJson(product)).toList();
        return categories;
      } else {
        print("Error: Failed to fetch products. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return categories;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return categories;
    }
  }
}