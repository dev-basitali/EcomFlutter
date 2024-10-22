import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/main.dart';

import '../../Model/new_model.dart';
import '../../Provider/favourite_provider.dart';
import '../../Screens/Product Details/product_details_2.dart';
import '../Utils/app_colors.dart';

class ItemsDisplay extends StatefulWidget {
  const ItemsDisplay({super.key});

  @override
  State<ItemsDisplay> createState() => _ItemsDisplayState();
}

class _ItemsDisplayState extends State<ItemsDisplay> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: storeItems.length,
      padding: EdgeInsets.symmetric(horizontal: width / 28.38 , vertical: height / 50.5),
      itemBuilder: (context, index) {
        ProductDetail items = storeItems[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
                  opacity: animation,
                  child: DetailPage(items: items,),
                ),
              ),
            );
          },
          child: Card(
            elevation: 4,
            child: Container(
              width: width /2.52, // Set a fixed width for the items in the list
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(
                        height: height /53.87,
                      ),
                      Hero(
                        tag: items.image,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: Image.network(
                              items.image,
                              height: height /6.73,
                              width: width /3.78,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                       SizedBox(
                        height: height /53.87,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width / 30.27),
                        child: Text(
                          items.name,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: height /42.52,
                            color: AppColor.typographyColor,
                          ),
                        ),
                      ),
                       SizedBox(
                        height: height / 202,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width / 30.27),
                        child: Row(
                          children: [

                            Text(
                              '$currency.${items.oldPrice}',
                                style: TextStyle(
                                  color: AppColor.naturalColor,
                                  fontSize: height / 50.71,
                                  decoration: TextDecoration.lineThrough,
                                ),
                            ),
                            const Spacer(),
                             Icon(
                              Icons.star,
                              color:AppColor.highlightColor,
                              size: height / 44.89,
                            ),
                             SizedBox(
                              width: width / 113.5,
                            ),
                            Text(
                              items.rate.toString(),
                              style: const TextStyle(
                                  color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width / 28.38 ),
                        child: Text(
                          '$currency.${items.price}',
                          style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height /36.73,
                              color: AppColor.primaryColor),
                        ),
                      )
                    ],
                  ),
                  Consumer<FavouriteItems>(
                    builder: (context, favouriteItems, child) {
                      bool isFavorite =
                      favouriteItems.selectedItems.contains(items.id);
                      return IconButton(
                        onPressed: () {
                          // if (isFavorite) {
                          //   favouriteItems.removeItem(items.id);
                          // } else {
                          //   favouriteItems.addItem(items.id);
                          // }
                        },
                        icon: Icon(
                          isFavorite
                              ? BootstrapIcons.heart_fill
                              : BootstrapIcons.heart,
                          color: isFavorite?AppColor.errorColor: AppColor.typographyColor
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      color: AppColor.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(13),
                      ),
                      child: InkWell(
                        borderRadius:  const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(13),
                    ),
                        onTap: () {},
                        child:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 56.75, vertical: height / 101),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
