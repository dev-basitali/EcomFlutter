import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';

class SaleProductCard extends StatelessWidget {
  final String imagePath;
  // final String productName;
  final double price;
  final double salePercentage;
  final double oldPrice;

  const SaleProductCard({
    super.key,
    required this.imagePath,
    // required this.productName,
    required this.price,
    required this.salePercentage,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4,
        color: AppColor.bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                // Product Image
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

                // Sale Percentage
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 56.75, vertical: height / 161.6),
                  decoration: BoxDecoration(
                    gradient: AppColor.gradientColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${salePercentage.toStringAsFixed(0)}% OFF',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width /56.75, vertical : height/101),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 161.6),
                  // Product Price
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColor.gradientColor.createShader(bounds),
                    child: Text(
                      '$currency.$price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // Set to white for the gradient to be visible
                        fontSize: height / 36.72,
                      ),
                    ),
                  ),
                  // Product Old Price
                  Text(
                    '$currency.$oldPrice',
                    style: TextStyle(
                      color: AppColor.naturalColor,
                      fontSize: height / 50.5,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
