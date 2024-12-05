import 'package:flutter/material.dart';
import 'package:store_app/Export/export_dev.dart';

import '../Payment Methods/apple_pay.dart';
import '../Payment Methods/card_payment.dart';
import '../Payment Methods/google_pay.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutProvider =
        Provider.of<CheckOutProvider>(context, listen: false);

    final List<String> paymentMethods = [
      'Credit Card/Debit Card',
      'Cash on Delivery',
      'Google Pay',
      'Apple Pay'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a payment method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<CheckOutProvider>(
                builder: (BuildContext context, CheckOutProvider provider,
                    Widget? child) {
                  return ListView.builder(
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(paymentMethods[index]),
                        leading: Radio<String>(
                          value: paymentMethods[index],
                          groupValue: provider.selectedPaymentMethod,
                          onChanged: (value) {
                            if (value != null) {
                              provider.selectedPaymentMethod =
                                  value; // Notify immediately
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (checkOutProvider.selectedPaymentMethod != null) {
                  // Handle the selected payment method
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (builder) => CashOnDelivery()),
                  // );
                  Widget selectedMethod;
                  switch (checkOutProvider.selectedPaymentMethod) {
                    case 'Credit Card/Debit Card':
                      selectedMethod = CardPaymentScreen();
                      break;
                    case 'Cash on Delivery':
                      selectedMethod = CashOnDelivery();
                      break;
                    case 'Google Pay':
                      selectedMethod = GooglePayScreen();
                      break;
                    case 'Apple Pay':
                      selectedMethod = ApplePayScreen();
                      break;
                    default:
                      selectedMethod = CashOnDelivery(); // Fallback screen
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => selectedMethod),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a payment method')),
                  );
                }
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
