import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text(
          'All Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.bgColor
          ),
        ),
        centerTitle: true,
        actions: [
          badges.Badge(
            showBadge: true,
            badgeContent: Consumer<CartProvider>(
              builder: (BuildContext context, CartProvider provider, Widget? child)
              {
                return Text(
                  provider.cartItems.length.toString(), // Number to display on the badge
                  style: const TextStyle(color: Colors.white), // Badge text style
                );
              },
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red, // Customize badge background color
              padding: EdgeInsets.all(3), // Padding inside the badge
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3), // Badge position
            child: IconButton(
              icon: const Icon(BootstrapIcons.cart3),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCartScreen()));

              },
            ),
          ),
        ],
        iconTheme: const IconThemeData(
            color: AppColor.bgColor), // Change drawer icon color here
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('ProductsScreen'),
      ),
    );
  }
}
