import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatefulWidget {
  final int? id;
  final int? quantity;
  final String? productName;
  final String? oldPrice;
  final String? newPrice;
  final String? category;
  final double? discountPercentage;
  final String imagePath;
  final String? ratingCount;
  const CustomProductCard({
    super.key,
    required this.id,
    this.quantity,
    required this.productName,
    required this.oldPrice,
    required this.newPrice,
    required this.category,
    this.discountPercentage,
    required this.imagePath,
    required this.ratingCount,
  });

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {

  ProductsDetail products =  ProductsDetail();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    // Create the product object to add to the cart
    final product = ProductsDetail(
      id: widget.id,
      name: widget.productName,
      price: widget.newPrice,
      stockQuantity: widget.quantity,
      images: [ImageData(src: widget.imagePath.replaceAll('localhost', '192.168.18.52'))],
    );

    return SizedBox(
      width: width / 2.1,
      child: Card(
        color: AppColor.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Product image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Image.network(
                      fit: BoxFit.cover,
                      widget.imagePath,
                      width: width / 3.5,
                      scale: 2,
                      height: height / 5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 28.36,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Category
                      SizedBox(height: height / 101,),
                      Text(widget.category!,
                          style: TextStyle(
                            fontSize: height / 60.4,
                            color: AppColor.naturalColor,
                          )),
                      // Product Name
                      Text(
                        widget.productName!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: height / 50.5,

                        ),
                        maxLines: 1, // Limit to 1 lines
                        overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
                      ),
                      SizedBox(height: height / 202),
                      // Product Ratings
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                          Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                          Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                          Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                          Icon(Icons.star_border,
                              color: Colors.grey, size: height / 40.4),
                          SizedBox(width: width / 113.5),
                          Icon(
                            Icons.message_outlined,
                            color: AppColor.naturalColor,
                            size: height / 50.5,
                          ),
                          Text('${widget.ratingCount}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: height / 62.27,
                              )),
                        ],
                      ),
                      SizedBox(height: height / 25.2),
                      // Old Price
                      SizedBox(
                        width: width /2.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '$currency.${widget.oldPrice}',
                                      style: TextStyle(
                                        fontSize: height / 50.89,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(width: width / 56.75),
                                    // DiscountPercentage
                                    Container(
                                      height: height / 47.53,
                                      width: width / 12.27,
                                      color: AppColor.rareColor,
                                      child: Center(
                                        child: Text(
                                          '-${widget.discountPercentage}%',
                                          style: TextStyle(
                                            color: AppColor.typographyColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 63.76,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // New Price
                                Text(
                                  '$currency.${widget.newPrice}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height / 26.76,
                                    color: AppColor.typographyColor,
                                  ),
                                ),
                              ],
                            ),
                            // Cart Provider
                            Consumer<CartProvider>(
                              builder: (BuildContext context, CartProvider provider, Widget? child) {
                                return Align(
                                  alignment: Alignment.bottomRight,
                                  child: Material(
                                    color: AppColor.primaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                    child: InkWell(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      onTap: () {
                                        // Check if the product is already in the cart
                                        bool isInCart = provider.cartItems.any((product)=> product.id == widget.id);
                                        if (!isInCart) {
                                          provider.addToCart(product,context);
                                          return;
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Product already in cart!')));
                                        }
                                      },
                                      // Cart Icon
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 36.27,
                                            vertical: height / 60.71),
                                        child: Icon(
                                          BootstrapIcons.cart3,
                                          color: Colors.white,
                                          size: height / 35.87,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height / 26.93,
                width: width / 14.13,
                decoration: const BoxDecoration(
                  color: AppColor.typographyColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                // favourite icon
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  onTap: () {},
                    // Favourite Provider
                  child: Consumer<FavouriteItems>(
                    builder: (context, favouriteItems, child) {

                      bool isFavorite = favouriteItems.isFavourite(product);
                      return IconButton(
                        onPressed: () {
                          if (isFavorite) {
                            favouriteItems.removeItem(product);
                          } else {
                            favouriteItems.addItem(product);
                          }
                        },
                        icon: Icon(
                          isFavorite ? BootstrapIcons.heart_fill : BootstrapIcons.heart,
                          color: isFavorite ? Colors.red : AppColor.bgColor,
                          size: height / 53.87,
                        ),
                      );
                    },
                  )
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}