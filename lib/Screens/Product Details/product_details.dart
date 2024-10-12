import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Common/Utils/app_colors.dart';
import '../../Model/lists_class.dart';
import '../../Provider/favourite_provider.dart';
import '../../main.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title:   Text(
          product.productName,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: product.productName,
                  child: Image.asset(
                    product.imagePath,
                    width: width / 1.2,
                    height: height / 3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 30),

            // Product Name
            Text(
              product.productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height / 35,
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: height / 60),

            // Product Price
            Row(
              children: [
                Text(
                  '$currency.${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: AppColor.errorColor,
                    fontSize: height / 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: width / 20),
                if (product.oldPrice > product.price)
                  Text(
                    '$currency.${product.oldPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: AppColor.naturalColor,
                      fontSize: height / 50,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
            SizedBox(height: height / 60),

            // Product Rating
            Row(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  color: index < product.rating ? Colors.orange : Colors.grey.shade300,
                ),
              ),
            ),
            SizedBox(height: height / 40),

            // Product Description (optional)
            Text(
              'This is a detailed description of ${product.productName}.',
              style: TextStyle(fontSize: height / 50, color: Colors.grey[700]),
            ),
            SizedBox(height: height / 40),

            // Add to Cart & Wishlist Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: AppColor.bgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: Text('Add to Cart',style: TextStyle(color: AppColor.primaryColor),),
                          onPressed: () {
                            // Handle cart action
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: Text('Buy Now',style: TextStyle(color: AppColor.bgColor),),
                          onPressed: () {
                            // Handle cart action
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Consumer<FavouriteItems>(
                  // Use Consumer to listen to changes
                  builder: (context, favouriteItems, child) {
                    bool isFavorite =
                    favouriteItems.selectedItems.contains(product.id);
                    return IconButton(
                      onPressed: () {
                        if (isFavorite) {
                          favouriteItems.removeItem(product.id);
                        } else {
                          favouriteItems.addItem(product.id);
                        }
                      },
                      icon: Icon(
                        isFavorite
                            ? BootstrapIcons.heart_fill
                            : BootstrapIcons.heart,
                        color:  Colors.red ,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
