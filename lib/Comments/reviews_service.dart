// import '../../Export/export_dev.dart';
// import 'package:http/http.dart' as http;
//
//
// class ReviewsService {
//   List<ProductReview> reviews = [];
//
//   Future<List<ProductReview>> getReviews(int productId) async {
//     const String baseUrl = 'https://192.168.18.52/ecomFlutterApp/wp-json/wc/v3/products/reviews';
//     const String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
//     const String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';
//
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret&product=$productId'),
//         headers: {
//           'CCApp': 'true'
//         },
//       );
//
//       print("Response Status Code: ${response.statusCode}");
//       var data = jsonDecode(response.body) as List;
//
//       if (response.statusCode == 200) {
//         reviews = data.map((review) => ProductReview.fromJson(review)).toList();
//         return reviews;
//       } else {
//         print("Error: Failed to fetch reviews. Status Code: ${response.statusCode}");
//         print("Error Message: ${response.body}");
//         return [];
//       }
//     } catch (e) {
//       print("Exception occurred: $e");
//       return [];
//     }
//   }
// }
