import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';

class TopDealsCardList extends StatelessWidget {
  final storeServices = StoreServices();


  TopDealsCardList({super.key,});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,  // Scroll horizontally
        itemCount: storeServices.topDeals.length,
        itemBuilder: (context, index) {

          return Padding(
            padding:  const EdgeInsets.symmetric(horizontal:  10),  // Add spacing between cards
            child: TopDealsCard(
              imagePath: storeServices.topDeals[index].imagePath,
              // productName: storeServices.saleProducts[index].productName,
              minPrice: storeServices.topDeals[index].minPrice,
              maxPrice: storeServices.topDeals[index].maxPrice,
              noOfItems: storeServices.topDeals[index].noOfItems,

            ),
          );
        },
      ),
    );
  }
}
