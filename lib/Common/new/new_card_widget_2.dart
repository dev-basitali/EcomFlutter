import 'package:flutter/material.dart';
import 'package:store_app/Common/Utils/app_colors.dart';
import 'package:store_app/Model/lists_class.dart';

import 'new_card_2.dart';
// Import the Product model

class ProductPageTwo extends StatelessWidget {
  ProductPageTwo({super.key});
  final products = StoreServices();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width /56.75 * 2, vertical : height/101 * 2),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return CustomCardTwo(productId: 1,);
          },
        ),
      ),
    );
  }
}


