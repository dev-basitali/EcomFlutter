
import 'package:flutter/material.dart';
import 'package:store_app/Common/Components/sale_product.dart';

import '../../Model/lists_class.dart';

class SaleProductCardList extends StatelessWidget {
  final storeServices = StoreServices();


   SaleProductCardList({super.key,});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,  // Scroll horizontally
        itemCount: storeServices.saleProducts.length,
        itemBuilder: (context, index) {

          return Padding(
            padding:  const EdgeInsets.symmetric(horizontal:  10),  // Add spacing between cards
            child: SaleProductCard(
              imagePath: storeServices.saleProducts[index].imagePath,
              // productName: storeServices.saleProducts[index].productName,
              price: storeServices.saleProducts[index].price,
              salePercentage: storeServices.saleProducts[index].salePercentage,
              oldPrice: storeServices.saleProducts[index].oldPrice,

            ),
          );
        },
      ),
    );
  }
}
