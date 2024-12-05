
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Export/export_dev.dart';


class SignInService {

  // String? _token; // Store JWT token in memory
  // // Function to login
  // // Function to login
  // Future<void> login(String username, String password , BuildContext context) async {
  //   String baseUrl = WpApiUrl.signInCustomer;
  //
  //   final Uri url = Uri.parse(baseUrl);
  //
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       "Content-Type": "application/json",
  //     },
  //     body: jsonEncode({
  //       "username": username,
  //       "password": password,
  //     }),
  //   );
  //
  //   // Log the response body to check what's being returned
  //   print('Response body: ${response.body}');
  //
  //   if (response.statusCode == 200) {
  //     // Parse the response
  //     final data = jsonDecode(response.body);
  //
  //     // Check if the token exists within the 'data' object
  //     if (data['data'] != null && data['data'].containsKey('token')) {
  //       _token = data['data']['token']; // Save JWT token in memory
  //       print('Login successful. Token: $_token');
  //     } else {
  //       print('Error: Token not found in the response.');
  //     }
  //   } else {
  //     // If there is an error
  //     final data = jsonDecode(response.body);
  //     print('Login failed. Status code: ${response.statusCode}');
  //     CoolAlert.show(
  //       context: context,
  //       type: CoolAlertType.error,
  //       text: "${data['code']}",
  //     );
  //     print('Error: ${data['code']}');
  //   }
  // }
  //
  //
  // // Getter to retrieve the JWT token
  // String? get token => _token;
}
