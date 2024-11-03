import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int productId; // Add a unique ID for the product
  final String imagePath;
  final String productName;
  final double price;
  final double oldPrice;
  final int rating; // Assuming a rating out of 5

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.productId,
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
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                height: height / 5.39,
                width: width / 2.06,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 56.75, vertical: height / 101),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 80.8),
                  // Product Name
                  Text(
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / 50.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: height / 161.5),
                  // Product Price & Old Price (if discounted)
                  Row(
                    children: [
                      Text(
                        '$currency.$price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.errorColor,
                          fontSize: height / 60.5,
                        ),
                      ),
                      SizedBox(width: width / 56.7),
                      if (oldPrice > price)
                        Text(
                          '$currency.$oldPrice',
                          style: TextStyle(
                            color: AppColor.naturalColor,
                            fontSize: height / 70.71,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: height / 161.6),
                  // Rating Row (Star icons and rating value)
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: height / 50.5,
                        color: index < rating
                            ? Colors.orange
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 80.8),
                  // Add to Cart & Wishlist Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.symmetric(
                                horizontal: width / 30.1,
                              )),
                              elevation: const WidgetStatePropertyAll(4),
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppColor.primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: AppColor.bgColor,
                                  fontSize: height / 65,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Consumer<FavouriteItems>(
                        // Use Consumer to listen to changes
                        builder: (context, favouriteItems, child) {
                          bool isFavorite =
                              favouriteItems.selectedItems.contains(productId);
                          return IconButton(
                            onPressed: () {
                              // if (isFavorite) {
                              //   favouriteItems.removeItem(productId);
                              // } else {
                              //   favouriteItems.addItem(productId);
                              // }
                            },
                            icon: Icon(
                              isFavorite
                                  ? BootstrapIcons.heart_fill
                                  : BootstrapIcons.heart,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ],
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
