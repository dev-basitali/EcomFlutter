import 'package:flutter/cupertino.dart';
import 'package:store_app/Export/export_dev.dart';
import 'package:http/http.dart' as http;
import '../../Model/variation_model.dart';

class WpServices {
  String? _token; // Store JWT token in memory
  String? get token => _token; // Getter to retrieve the JWT token
  set token(String? value) {
    _token = value;
  }

// Products Service
  static List<ProductsDetail> products = [];
  static Future<List<ProductsDetail>> getProducts() async {
    const String baseUrl = WpApiUrl.products;
    const String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
    const String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';

    try {
      final response = await http.get(
          Uri.parse(
              '$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret'),
          headers: {'CCApp': 'true'});
      print("Response Status Code: ${response.statusCode}");
      var data = jsonDecode(response.body) as List;
      print("Data: $data");

      if (response.statusCode == 200) {
        products =
            data.map((product) => ProductsDetail.fromJson(product)).toList();
        return products;
      } else {
        print(
            "Error: Failed to fetch products. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return products;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return products;
    }
  }

  // Reviews Service
  static List<ProductReview> reviews = [];
  static Future<List<ProductReview>> getReviews(int productId) async {
    const String baseUrl = WpApiUrl.review;
    const String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
    const String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';

    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret&product=$productId'),
        headers: {'CCApp': 'true'},
      );

      print("Response Status Code: ${response.statusCode}");
      var data = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        reviews = data.map((review) => ProductReview.fromJson(review)).toList();
        return reviews;
      } else {
        print(
            "Error: Failed to fetch reviews. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Exception occurred: $e");
      return [];
    }
  }

  // Variations Service
  static List<ProductVariation> productVariation = [];
  static Future<List<ProductVariation>> fetchProductVariation(
      BuildContext context) async {
    final provider = Provider.of<FavouriteItems>(context);
    String baseUrl = WpApiUrl.variations(provider.id);
    const String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
    const String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';

    try {
      final response = await http.get(
          Uri.parse(
              '$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret'),
          headers: {'CCApp': 'true'});
      print("Response Status Code: ${response.statusCode}");
      var data = jsonDecode(response.body) as List;
      print("Data: $data");

      if (response.statusCode == 200) {
        productVariation =
            data.map((product) => ProductVariation.fromJson(product)).toList();
        return productVariation;
      } else {
        print(
            "Error: Failed to fetch products. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return productVariation;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return productVariation;
    }
  }

  // Categories Service
  static List<CategoryModel> categories = [];
  static Future<List<CategoryModel>> getCategories() async {
    const String baseUrl = WpApiUrl.category;
    const String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
    const String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';

    try {
      final response = await http.get(
          Uri.parse(
              '$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret'),
          headers: {'CCApp': 'true'});
      print("Response Status Code: ${response.statusCode}");
      var data = jsonDecode(response.body) as List;
      print("Data: $data");

      if (response.statusCode == 200) {
        categories =
            data.map((product) => CategoryModel.fromJson(product)).toList();
        return categories;
      } else {
        print(
            "Error: Failed to fetch products. Status Code: ${response.statusCode}");
        print("Error Message: ${response.body}");
        return categories;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return categories;
    }
  }

  // registerCustomer service
  static Future<void> registerCustomer({
    required String email,
    required String firstname,
    required String lastname,
    required String password,
  }) async {
    String consumerKey = "ck_33c568a00f12937c153e6382da73c0e182d13226";
    String consumerSecret = "cs_cbc268e06bc7f466e690452b3706d9938926489a";
    String baseUrl = WpApiUrl.addNewCustomer;
    final url = Uri.parse(
        "$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "email": email,
        "first_name": firstname,
        "last_name": lastname,
        "password": password,
        "username": email,
      }),
    );
    if (response.statusCode == 201) {
      // Registration successful
      return;
    } else {
      // Parse error response
      final responseBody = json.decode(response.body);
      String errorMessage = responseBody['message'] ?? 'An error occurred';
      // Specific WooCommerce errors for email
      if (responseBody['code'] == 'registration-error-email-exists') {
        throw Exception('The email address is already registered.');
      } else if (responseBody['code'] == 'registration-error-invalid-email') {
        throw Exception('The email address is not valid.');
      } else {
        throw Exception(errorMessage);
      }
    }
  }

  // Login Service
  Future<void> login(
      String username, String password, BuildContext context) async {
    String baseUrl = WpApiUrl.signInCustomer;

    final Uri url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    // Log the response body to check what's being returned
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Parse the response
      final data = jsonDecode(response.body);

      // Check if the token exists within the 'data' object
      if (data['data'] != null && data['data'].containsKey('token')) {
        _token = data['data']['token']; // Save JWT token in memory
        print('Login successful. Token: $_token');
      } else {
        print('Error: Token not found in the response.');
      }
    } else {
      // If there is an error
      final data = jsonDecode(response.body);
      print('Login failed. Status code: ${response.statusCode}');
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "${data['code']}",
      );
      print('Error: ${data['code']}');
    }
  }

  static Future<void> createOrder(
    CartProvider cartProvider,
    CheckOutProvider checkOutProvider,
  ) async {
    String apiUrl = 'https://192.168.18.52/ecomFlutterApp/wp-json/wc/v3/orders';
    String consumerKey = 'ck_33c568a00f12937c153e6382da73c0e182d13226';
    String consumerSecret = 'cs_cbc268e06bc7f466e690452b3706d9938926489a';

    final url = Uri.parse(
        '$apiUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret&customer_id=0&status=completed');

    // Use selected payment method from checkOutProvider
    String paymentMethod = checkOutProvider.selectedPaymentMethod ?? 'bacs';
    String paymentMethodTitle = paymentMethod == 'bacs'
        ? 'Direct Bank Transfer'
        : 'Other Payment Method'; // Adjust titles for other methods

    // Use selected shipping address from checkOutProvider
    ShippingAddress shippingAddress =
        checkOutProvider.getShippingAddress.isNotEmpty
            ? checkOutProvider.getShippingAddress.first
            : ShippingAddress(); // Default or error handling

    // Create line items from cartProvider's cart items and quantities
    List<Map<String, dynamic>> lineItems = [];
    for (int i = 0; i < cartProvider.cartItems.length; i++) {
      lineItems.add({
        'product_id': cartProvider.cartItems[i].id, // Use product ID
        'quantity': cartProvider.itemsQuantity[i], // Use product quantity
      });
    }

    final body = jsonEncode({
      'payment_method': paymentMethod,
      'customer_id': '',
      'status': 'on-hold',
      'payment_method_title': paymentMethod,
      'set_paid': true,
      'billing': shippingAddress.toJson(), // Set billing details
      'shipping': shippingAddress.toJson(), // Set shipping details
      'line_items': lineItems,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        print('Order created successfully!');
      } else {
        print('Failed to create order: ${response.statusCode}');
        print(response.body);
      }
    } catch (error) {
      print('Error creating order: $error');
    }
  }
}
