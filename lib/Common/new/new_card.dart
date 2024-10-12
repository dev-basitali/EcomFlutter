import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Model/product_service.dart';
import 'package:store_app/main.dart';

import '../../Provider/favourite_provider.dart';
import '../Utils/app_colors.dart';
class CustomProductCard extends StatefulWidget {
  final int? id;
  final String? productName;
  final String? oldPrice;
  final String? newPrice;
  final double? discountPercentage;
  final String imagePath;
  final String? ratingCount;
  const CustomProductCard({
    super.key,
    required this.id,
    required this.productName,
    required this.oldPrice,
    required this.newPrice,
    this.discountPercentage,
     required this.imagePath,
    required this.ratingCount,
  });

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Card(
      color: AppColor.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                width: width / 1.77,
                padding:
                     EdgeInsets.symmetric(vertical: height / 40.4,),
                child: Image.network(
                  widget.imagePath != null ? widget.imagePath : 'images',
                  fit: BoxFit.contain,
                  height: height /4.25,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: width / 15.22,bottom: height /13.93 ),
                child: Column(
                  children: [
                    Container(
                      height: height / 26.93,
                      width: width / 14.13,
                      decoration: const BoxDecoration(
                        color: AppColor.typographyColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        onTap: () {},
                        child: Consumer<FavouriteItems>(
                          // Use Consumer to listen to changes
                          builder: (context, favouriteItems, child) {
                            bool isFavorite =
                                favouriteItems.selectedItems.contains(widget.id);
                            return IconButton(
                              onPressed: () {
                                if (isFavorite) {
                                  favouriteItems.removeItem(widget.id!);
                                } else {
                                  favouriteItems.addItem(widget.id!);
                                }
                              },
                              icon: Icon(
                                isFavorite
                                    ? BootstrapIcons.heart_fill
                                    : BootstrapIcons.heart,
                                color:
                                    isFavorite ? Colors.red : AppColor.bgColor,
                                size: height / 53.87,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                     SizedBox(height: height / 161.6,),
                    Container(
                      height: height / 26.93,
                      width: width / 14.13,
                      decoration: const BoxDecoration(
                        color: AppColor.rareColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: InkWell(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(30)),
                        onTap: () {},
                        child:  Icon(
                          Icons.balance,
                          color: Color(0xff363842),
                          size: height / 50.5,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: width / 28.36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productName!,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: height / 44.89,
                  ),
                ),
                 SizedBox(height: height / 202),
                Row(
                  children: [
                     Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                     Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                     Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                     Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                     Icon(Icons.star_border, color: Colors.grey, size: height / 40.4),
                     SizedBox(width: width / 113.5),
                     Icon(
                      Icons.message_outlined,
                      color: AppColor.naturalColor,
                      size: height / 50.5,
                    ),
                    Text('${widget.ratingCount}',
                        style:  TextStyle(
                            color: Colors.grey,
                          fontSize: height / 62.27,
                        )
                    ),
                  ],
                ),
                 SizedBox(height: height / 20.2),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '$currency.${widget.oldPrice}',
                              style:  TextStyle(
                                fontSize: height /44.89,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                             SizedBox(width: width / 56.75),
                            Container(
                              height: height / 47.53,
                              width: width /12.27,
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
                        Text(
                          '$currency.${widget.newPrice}',
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height / 23.76,
                            color: AppColor.typographyColor,
                          ),
                        ),
                      ],
                    ),
                     SizedBox(width: width / 9.08),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Material(
                        color: AppColor.primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          onTap: () {},
                          child:  Padding(
                            padding: EdgeInsets.symmetric(horizontal: width / 30.27, vertical: height / 57.71),
                            child: Icon(
                              BootstrapIcons.cart3,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
