import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:store_app/Model/variation_model.dart';
import 'package:store_app/Provider/favourite_provider.dart';


class VariationService {

  List<ProductVariation> productVariation = [];
  Future<List<ProductVariation>> fetchProductVariation(BuildContext context) async {
    final provider = Provider.of<FavouriteItems>(context);
     String baseUrl = 'https://192.168.100.5/ecomFlutter/wp-json/wc/v3/products/${provider.id}/variations';
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
        productVariation = data.map((product) => ProductVariation.fromJson(product)).toList();
        return productVariation;
      } else {
        print("Error: Failed to fetch products. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return productVariation;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return productVariation;
    }
  }
}