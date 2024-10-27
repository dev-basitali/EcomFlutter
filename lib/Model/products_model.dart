import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/Model/product_service.dart';

class ProductsModel {
  List<ProductsDetail> products = [];
  Future<List<ProductsDetail>> getProducts() async {
    const String baseUrl = 'https://192.168.100.5/ecomFlutter/wp-json/wc/v3/products';
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
        products = data.map((product) => ProductsDetail.fromJson(product)).toList();
        return products;
      } else {
        print("Error: Failed to fetch products. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return products;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return products;
    }
  }
}