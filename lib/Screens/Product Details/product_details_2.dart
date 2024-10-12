import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/main.dart';

import '../../Common/Utils/app_colors.dart';
import '../../Model/new_model.dart';
import '../../Provider/favourite_provider.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.items});
  final ProductDetail items;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

int quantity = 1;

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Text(
          'Product Details',
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
      backgroundColor: AppColor.bgColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          // detail header
          detailItemsHeader(),
          // for image
          detailImage(),
          Container(
            color: AppColor.bgColor,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // For name
                          Text(
                            widget.items.name,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 34),
                          ),
                          // For price
                          Text(
                            '\$${widget.items.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: AppColor.bgColor),
                          ),
                        ],
                      ),
                    ),
                    // For items quantity
                    Material(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                quantity -= 1;
                                setState(() {});
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: AppColor.bgColor,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$quantity",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          IconButton(
                            onPressed: () {
                              quantity += 1;
                              setState(() {});
                            },
                            icon:  const Icon(
                              Icons.add,
                              color: AppColor.bgColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  children: [
                    // For rating
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.items.rate.toString(),
                      style:
                      const TextStyle(color: Colors.black38, fontSize: 18),
                    ),
                    const Spacer(),
                    // For kcla
                    const Icon(
                     BootstrapIcons.currency_dollar,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                     '$currency.${widget.items.price.toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Spacer(),
                    // For time
                    const Icon(
                      Icons.access_time_filled,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.items.deliveryTime,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                // For description
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.items.description,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                // For add to cart button
                const SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 200,

                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              elevation: 4,
                              backgroundColor: AppColor.bgColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                  color: AppColor.primaryColor, // Border color
                                  width: 1, // Border width
                                ),
                              ),
                            ),
                            label: const Text('Add to Cart',style: TextStyle(color: AppColor.primaryColor),),
                            onPressed: () {
                              // Handle cart action
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              elevation: 4,
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            label: const Text('Buy Now',style: TextStyle(color: AppColor.bgColor),),
                            onPressed: () {
                              // Handle cart action
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox detailImage() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Hero(
              tag: widget.items.image,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.green[400]!,
                      blurRadius: 15,
                      offset: const Offset(0, 8))
                ],
                borderRadius: BorderRadius.circular(250),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: Image.network(
                  widget.items.image,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding detailItemsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.white.withOpacity(0.21),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: Consumer<FavouriteItems>(
                      // Use Consumer to listen to changes
                      builder: (context, favouriteItems, child) {
                        bool isFavorite =
                        favouriteItems.selectedItems.contains(widget.items.id);
                        return IconButton(
                          onPressed: () {
                            if (isFavorite) {
                              favouriteItems.removeItem(widget.items.id);
                            } else {
                              favouriteItems.addItem(widget.items.id);
                            }
                          },
                          icon: Icon(
                            isFavorite
                                ? BootstrapIcons.heart_fill
                                : BootstrapIcons.heart,
                              color: isFavorite?AppColor.errorColor: AppColor.typographyColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
// design is completed