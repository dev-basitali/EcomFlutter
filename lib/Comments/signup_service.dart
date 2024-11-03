// import 'package:http/http.dart' as http;
// import '../../Export/export_dev.dart';
//
// class SignUpService {
//   // Replace with your WooCommerce credentials and URL
//
//   static Future<void> registerCustomer({
//     required String email,
//     required String firstname,
//     required String lastname,
//     required String password,
//   }) async {
//     String consumerKey = "ck_33c568a00f12937c153e6382da73c0e182d13226";
//     String consumerSecret = "cs_cbc268e06bc7f466e690452b3706d9938926489a";
//     String baseUrl = "https://192.168.18.52/ecomFlutterApp/wp-json/wc/v3/customers";
//
//     final url = Uri.parse("$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret");
//
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         "email": email,
//         "first_name": firstname,
//         "last_name": lastname,
//         "password": password,
//         "username": email,
//       }),
//     );
//
//     if (response.statusCode == 201) {
//       // Registration successful
//       return;
//     } else {
//       // Parse error response
//       final responseBody = json.decode(response.body);
//       String errorMessage = responseBody['message'] ?? 'An error occurred';
//
//       // Specific WooCommerce errors for email
//       if (responseBody['code'] == 'registration-error-email-exists') {
//
//         throw Exception('The email address is already registered.');
//       } else if (responseBody['code'] == 'registration-error-invalid-email') {
//         throw Exception('The email address is not valid.');
//       } else {
//         throw Exception(errorMessage);
//       }
//     }
//   }
// }
