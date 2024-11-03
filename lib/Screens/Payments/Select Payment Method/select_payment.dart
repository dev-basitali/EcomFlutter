import 'package:flutter/material.dart';
import 'package:store_app/Export/export_dev.dart';


class SelectPaymentMethodScreen extends StatelessWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CheckOutProvider>(context, listen: false);

    final List<String> paymentMethods = [
      'Credit Card',
      'Debit Card',
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
              child: ListView.builder(
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
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (provider.selectedPaymentMethod != null) {
                  // Handle the selected payment method
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => PaymentMethods()),
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
