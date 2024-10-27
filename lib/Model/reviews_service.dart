import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/Model/reviews_model.dart';

class ReviewsService {
  List<ProductReview> reviews = [];

  Future<List<ProductReview>> getReviews(int productId) async {
    const String baseUrl = 'https://192.168.100.5/ecomFlutter/wp-json/wc/v3/products/reviews';
    const String consumerKey = 'ck_d3c2d1f8f9fad21b9418d65340693709d7a20390';
    const String consumerSecret = 'cs_8f4821b3ca6431aea2620ad610249bb2d21a32ba';

    try {
      final response = await http.get(
        Uri.parse('$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret&product=$productId'),
        headers: {
          'CCApp': 'true'
        },
      );

      print("Response Status Code: ${response.statusCode}");
      var data = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        reviews = data.map((review) => ProductReview.fromJson(review)).toList();
        return reviews;
      } else {
        print("Error: Failed to fetch reviews. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Exception occurred: $e");
      return [];
    }
  }
}
