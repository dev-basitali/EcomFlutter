
import 'package:flutter/material.dart';
import 'package:store_app/Common/Components/product_card.dart';

import '../../Model/lists_class.dart';

class ProductCardList extends StatelessWidget {
  final storeServices = StoreServices();

  ProductCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height / 2.04,  // Adjust based on your card size
      child: ListView.builder(
        scrollDirection: Axis.horizontal,  // Scroll horizontally
        itemCount: storeServices.products.length,
        itemBuilder: (context, index) {
          // Access individual product by index
          final product = storeServices.products[index];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 162.2),  // Add spacing between cards
            child: ProductCard(
              productId: product.id,              // Access properties of the product
              imagePath: product.imagePath,
              productName: product.productName,
              price: product.price,
              oldPrice: product.oldPrice,
              rating: product.rating,
            ),
          );
        },
      ),
    );
  }
}