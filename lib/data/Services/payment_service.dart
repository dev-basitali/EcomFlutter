import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../Common/Utils/consts.dart';
import '../../Export/export_dev.dart';
import '../../Provider/cart_provider.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(
      CartProvider cartProvider, BuildContext context) async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(
        cartProvider.subTotal, // Use cart subtotal
        "usd",
        context,
      );
      if (paymentIntentClientSecret == null) return;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Seerox",
        ),
      );

      await _processPayment();
    } catch (e) {
      print("Error in makePayment: $e");
    }
  }

  Future<String?> _createPaymentIntent(
      double subTotal, String currency, BuildContext context) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount":
            (subTotal * 100).toInt().toString(), // Convert subtotal to cents
        "currency": currency,
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );
      if (response.data != null) {
        return response.data["client_secret"];
      }

      return null;
    } catch (e) {
      print("Error in _createPaymentIntent: $e");
      return null;
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();

      print("Payment completed successfully!");
    } catch (e) {
      print("Error in _processPayment: $e");
    }
  }
}
