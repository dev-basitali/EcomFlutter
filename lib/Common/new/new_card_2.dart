import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/main.dart';

import '../../Provider/favourite_provider.dart';
import '../Utils/app_colors.dart';

class CustomCardTwo extends StatelessWidget {
  final int productId;
  const CustomCardTwo({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Card(
      color: AppColor.bgColor,
      elevation: 4,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/headphones.jpg',

                  height: height /5.39,
                  fit: BoxFit.fitWidth,
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
                      color: isFavorite
                          ? AppColor.errorColor :
                      AppColor.naturalColor,
                    ),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width /56.75, vertical : height/101),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: height / 202,),
                Text(
                    'Headphones',
                  style: TextStyle(fontSize: height /40.4, fontWeight: FontWeight.bold),
                ),
                SizedBox(height:  height /101,),
                Text(
                    '$currency.100.00 ',
                  style: TextStyle(
                      fontSize: height / 31.08,
                      fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor
                  ),
                ),
                SizedBox(height: height /101,),
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
                          label: Text('Add to Cart',style: TextStyle(
                              color: AppColor.primaryColor,
                            fontSize: height / 70.08,
                          ),),
                          onPressed: () {
                            // Handle cart action
                          },
                        ),
                      ],
                    ),
                    SizedBox(width: width /45.4,),
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
                          label: Text('Buy Now',style: TextStyle(color: AppColor.bgColor,fontSize: height / 70.08,),),
                          onPressed: () {
                            // Handle cart action
                          },
                        ),
                      ],
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
