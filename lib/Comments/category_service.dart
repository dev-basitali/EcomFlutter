//
// import 'package:http/http.dart' as http;
// import '../../Export/export_dev.dart';
//
// class CategoryService {
//   List<CategoryModel> categories = [];
//   Future<List<CategoryModel>> getCategories() async {
//     const String baseUrl = 'https://192.168.18.52/ecomFlutterApp/wp-json/wc/v3/products/categories';
//     const String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
//     const String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';
//
//     try {
//       final response = await http.get(
//           Uri.parse('$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret'),
//           headers: {
//             'CCApp' : 'true'
//           }
//       );
//       print("Response Status Code: ${response.statusCode}");
//       var data = jsonDecode(response.body) as List;
//       print("Data: $data");
//
//       if (response.statusCode == 200) {
//         categories = data.map((product) => CategoryModel.fromJson(product)).toList();
//         return categories;
//       } else {
//         print("Error: Failed to fetch products. Status Code: ${response.statusCode}");
//         print("Error Message: ${response.body}");
//         return categories;
//       }
//     } catch (e) {
//       print("Exception occurred: $e");
//       return categories;
//     }
//   }
// }