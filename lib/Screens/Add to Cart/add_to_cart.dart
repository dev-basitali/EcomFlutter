import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';



class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: AppColor.bgColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.bgColor),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    BootstrapIcons.cart3,
                    size: 50,
                    color: AppColor.naturalColor,
                  ),
                  Text(
                    'Your Cart Is Empty',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.typographyColor,
                    ),
                  ),
                  Text('When you add products, they\'ll'),
                ],
              ),
            )
          : Consumer<CartProvider>(
              builder:
                  (BuildContext context, CartProvider provider, Widget? child) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.cartItems.length,
                        itemBuilder: (context, index) {
                          final product = provider.cartItems[index];
                          final double unitPrice =
                              double.tryParse(product.price ?? '0') ??
                                  0; // Get the unit price of the product
                          final double totalPrice =
                              unitPrice * provider.itemsQuantity[index];
                          return Card(
                              color: AppColor.bgColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                            product.images![0].src!.replaceAll(
                                                "localhost", "192.168.18.52")),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 330,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(product.name ??
                                                      'Product Name'),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: AppColor
                                                          .typographyColor,
                                                    ),
                                                    onPressed: () {
                                                      provider.removeFromCart(
                                                          product);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1),
                                                              content: Text(
                                                                  'Product is removed from the cart!')));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                                '${product.stockQuantity} item(s) are in stock'),
                                            SizedBox(
                                              width: 330,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Price: \$${totalPrice.toStringAsFixed(2)}'),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.remove,
                                                          color: AppColor
                                                              .typographyColor,
                                                        ),
                                                        onPressed: () {
                                                          provider
                                                              .removeCounter(
                                                                  index);
                                                        },
                                                      ),
                                                      Text(
                                                          '${provider.itemsQuantity[index]}'),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: AppColor
                                                              .typographyColor,
                                                        ),
                                                        onPressed: () {
                                                          provider.addCounter(
                                                              product, index);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: width / 1.3,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Total price: '),
                                Text(
                                    '\$${provider.subTotal.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                          Divider(),
                          Gap(10),
                          SizedBox(
                            width: width / 1.3,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Shipping Fee'),
                                Text(
                                    '\$${provider.subTotal.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                          Divider(),
                          Gap(10),
                          SizedBox(
                            width: width / 1.3,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Discounted price: '),
                                Text(
                                    '\$${provider.subTotal.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                          Divider(),
                          Gap(10),
                          SizedBox(
                            width: width / 1.3,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckoutScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // Set the desired radius
                                  ),
                                ),
                                child: Text('CheckOut')),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
