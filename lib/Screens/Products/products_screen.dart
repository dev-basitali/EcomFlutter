import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Common/Utils/app_colors.dart';

import '../../Common/Components/my_drawer.dart';

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
          IconButton(
            icon: const Icon(BootstrapIcons.cart3),
            onPressed: () {
              // Implement your cart functionality here
            },
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
