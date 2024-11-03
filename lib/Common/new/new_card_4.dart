import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';

class CustomCardFour extends StatelessWidget {
  final int productId;
  const CustomCardFour({super.key, required this.productId});

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
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/headphones.jpg',
                  width: width /1.97,
                  height: height / 5.37,
                  fit: BoxFit.cover,
                ),
              ),
              // Consumer<FavouriteItems>(
              //   // Use Consumer to listen to changes
              //   builder: (context, favouriteItems, child) {
              //     bool isFavorite =
              //     favouriteItems.selectedItems.contains(productId);
              //     return IconButton(
              //       onPressed: () {
              //         if (isFavorite) {
              //           favouriteItems.removeItem(productId);
              //         } else {
              //           favouriteItems.addItem(productId);
              //         }
              //       },
              //       icon: Icon(
              //         isFavorite
              //             ? BootstrapIcons.heart_fill
              //             : BootstrapIcons.heart,
              //         color: isFavorite
              //             ? AppColor.errorColor :
              //         AppColor.naturalColor,
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width /56.75, vertical : height/101),
            child: SizedBox(
              width: width / 2.12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height /202,),
                  Text(
                    'HeadphonesHeadphones Headphones,HeadphonesHeadphonesHeadphones',
                    style: TextStyle(fontSize: height / 40.4, fontWeight: FontWeight.bold),
                    maxLines: 2, // Limit to 2 lines
                    overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
                  ),
                  SizedBox(height: height / 101,),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                      Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                      Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                      Icon(Icons.star, color: Colors.amber, size: height / 40.4),
                      Icon(Icons.star, color: Colors.grey[400], size: height / 40.4),
                      SizedBox(width: width / 113.5),
                      Container(
                        height: height / 47.53,
                        width: width / 15.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue[100],
                        ),
                        child: Center(
                          child: Text(
                            '5.0',
                            style:  TextStyle(
                              color: AppColor.typographyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: height / 60.27,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 80.8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$currency.100.0 ',
                            style: TextStyle(
                                fontSize: height / 47.5,
                                fontWeight: FontWeight.bold,
                                color: AppColor.typographyColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: width / 45.4,),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: width / 25.7),
                              elevation: 4,
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            label: Text(
                              'Add to Cart',style: TextStyle(
                                color: AppColor.bgColor,
                              fontSize: height / 65.13,

                            ),),
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
          ),
        ],
      ),
    );
  }
}
