import 'package:flutter/material.dart';

import '../../../Export/export_dev.dart'; // Your export file

class CashOnDelivery extends StatefulWidget {
  const CashOnDelivery({super.key});

  @override
  State<CashOnDelivery> createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  @override
  Widget build(BuildContext context) {
    // Access the CartProvider and CheckOutProvider
    final cartProvider = Provider.of<CartProvider>(context);
    final checkoutProvider =
        Provider.of<CheckOutProvider>(context); // Add this line

    return Scaffold(
        appBar: AppBar(
          title: Text('Cash on Delivery'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Order items summary
              _buildOrderSummary(
                  cartProvider.cartItems, cartProvider.itemsQuantity),
              Divider(),
              // Total amount section
              _buildTotalAmount(cartProvider.subTotal),
              SizedBox(height: 20),
              // Address details
              _buildDeliveryAddress(
                  checkoutProvider), // Pass the provider to this method
              Divider(),
              SizedBox(height: 20),
              // Terms and Conditions Checkbox
              _buildTermsCheckbox(),
              Spacer(),
              // Confirm Order button
              _buildConfirmButton(context),
            ],
          ),
        ));
  }

  Widget _buildOrderSummary(List<ProductsDetail> items, List<int> quantities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Text(
          '${item.name}: \$${(double.tryParse(item.price ?? '0') ?? 0) * quantities[index]}',
          style: TextStyle(fontSize: 16),
        );
      }).toList(),
    );
  }

  Widget _buildTotalAmount(double subTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Amount:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$${subTotal.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDeliveryAddress(CheckOutProvider checkoutProvider) {
    // Accept provider as parameter
    final addresses = checkoutProvider.getShippingAddress;

    if (addresses.isEmpty) {
      return Text(
        'No delivery address available.',
        style: TextStyle(fontSize: 16),
      );
    }

    final address = addresses.first; // Get the first address for display
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          '${address.firstName} ${address.lastName},\n${address.address1},\n${address.city}, ${address.state}, ${address.postcode}',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Email: ${address.email}',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Phone: ${address.phone}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (bool? newValue) {}),
        Expanded(
          child: Text(
            'I agree to the Cash on Delivery terms and conditions.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final cartProvider =
                Provider.of<CartProvider>(context, listen: false);
            final checkOutProvider =
                Provider.of<CheckOutProvider>(context, listen: false);

            // Call the createOrder function and show confirmation dialog on success
            await WpServices.createOrder(cartProvider, checkOutProvider);

            // Clear the cart items after the order is created
            cartProvider.clearCart();

            // Show confirmation dialog after the order is created
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Order Confirmed'),
                  content: Text('Your order has been placed successfully.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => BottomNavigation()),
                        );
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text(
            'Confirm Order',
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
