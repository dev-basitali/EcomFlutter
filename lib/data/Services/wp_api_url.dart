class WpApiUrl {
  static const String baserUrl = "https://192.168.100.5/ecomFlutter/wp-json";

  static const String category = "$products/categories";
  static const String review = "$products/reviews";
  static const String products = "$baserUrl/wc/v3/products";
  static const String addNewCustomer = "$baserUrl/wc/v3/customers";
  static const String signInCustomer = "$baserUrl/jwt-auth/v1/token";
  static const String orderCheckout = "$baserUrl/wc/v3/orders";
  static String variations (int id) {
    return "$products/$id/variations";
  }
}
