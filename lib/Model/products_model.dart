import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/Model/product_service.dart';

class ProductsModel {
  List<ProductsDetail> products = [];
  Future<List<ProductsDetail>> getProducts() async {
    const String baseUrl = 'https://192.168.18.52/ecomFlutterApp/wp-json/wc/v3/products';
    const String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
    const String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';

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