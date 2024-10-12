import 'package:flutter/material.dart';
import 'package:store_app/Common/Utils/app_colors.dart';
import 'package:store_app/main.dart';

class TopDealsCard extends StatelessWidget {
  final String imagePath;
  // final String productName;
  final double minPrice;
  final double maxPrice;
  final double noOfItems;

  const TopDealsCard({super.key,
    required this.imagePath,
    // required this.productName,
    required this.minPrice,

    required this.maxPrice,
    required this.noOfItems,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // Main Card Container
        InkWell(
          onTap: (){},
          child: Card(
            elevation: 4,
            color: AppColor.bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: height / 8.08,
                    width: width / 3.02,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width /56.75, vertical : height/101),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image

                      SizedBox(height: height /161.6),
                      // Product Price
                      Text(
                        '$currency.$minPrice\tto',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor, // Set to white for the gradient to be visible
                          fontSize: height /50.72,
                        ),
                      ),
                      Text(
                        '$currency.$maxPrice',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:  AppColor.primaryColor, // Set to white for the gradient to be visible
                          fontSize: height /50.72,
                        ),
                      ),
                      SizedBox(height: height /161.1),
                      // Product Name
                      Text(
                        'Min. order: $noOfItems piece',
                        style:  TextStyle(
                          fontSize: height /66.72,
                          color: AppColor.naturalColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
