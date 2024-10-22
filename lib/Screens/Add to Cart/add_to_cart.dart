import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:store_app/Common/Utils/app_colors.dart';
import 'package:store_app/Model/product_service.dart';
import 'package:store_app/Provider/cart_provider.dart';

import '../../Model/products_model.dart';
import '../CheckOut/checkout_screen.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  final ProductsModel productsModel = ProductsModel(); // Access store services
  ProductsDetail productsDetail = ProductsDetail();

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
        // actions: [
        //   badges.Badge(
        //     showBadge: true,
        //     badgeContent: Consumer<CartProvider>(
        //       builder: (BuildContext context, CartProvider provider, Widget? child)
        //       {
        //         return Text(
        //           provider.cartItems.length.toString(), // Number to display on the badge
        //           style: const TextStyle(color: Colors.white), // Badge text style
        //         );
        //       },
        //     ),
        //     badgeStyle: const badges.BadgeStyle(
        //       badgeColor: Colors.red, // Customize badge background color
        //       padding: EdgeInsets.all(3), // Padding inside the badge
        //     ),
        //     position: badges.BadgePosition.topEnd(top: 0, end: 3), // Badge position
        //     child: IconButton(
        //       icon: const Icon(BootstrapIcons.cart3),
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCartScreen()));
        //
        //       },
        //     ),
        //   ),
        // ],
        iconTheme: const IconThemeData(color: AppColor.bgColor),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
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
                      child: Container(
                        color: AppColor.rareColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                'Total price: \$${provider.subTotal.toStringAsFixed(2)}'),
                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckoutScreen()));
                                },
                                child: Text('CheckOut'))
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
