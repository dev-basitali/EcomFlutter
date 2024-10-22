import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:badges/badges.dart' as badges;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Common/Utils/app_colors.dart';
import 'package:store_app/Common/new/new_card_widget_2.dart';
import '../../Common/Components/card_listView.dart';
import '../../Common/Components/my_drawer.dart';
import '../../Common/Components/saleProductCard_listView.dart';
import '../../Common/Components/top_deals_listView.dart';
import '../../Common/new/new_card_3.dart';
import '../../Common/new/new_card_widget.dart';
import '../../Common/new/new_card_widget_4.dart';
import '../../Model/lists_class.dart';
import '../../Common/Components/card.dart';
import '../../Model/products_model.dart';
import '../../Provider/cart_provider.dart';
import '../../main.dart';
import '../Add to Cart/add_to_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductsModel productsModel =  ProductsModel();

  final storeServices = StoreServices();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(height);
    print(width);
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: isSearching
            ? Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: height / 45),
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                  autofocus: true,
                  onChanged: (query) {
                    // Handle search query changes
                  },
                ),
              )
            : const Text(
                'Store App',
                style: TextStyle(
                  color: AppColor.bgColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(
              isSearching ? BootstrapIcons.x : BootstrapIcons.search,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching; // Toggle the search bar
              });
            },
          ),
          badges.Badge(
            showBadge: true,
            badgeContent: Consumer<CartProvider>(
              builder: (BuildContext context, CartProvider provider, Widget? child)
              {
                return Text(
                  provider.cartItems.length.toString(), // Number to display on the badge
                  style: const TextStyle(color: Colors.white), // Badge text style
                );
              },
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red, // Customize badge background color
              padding: EdgeInsets.all(4), // Padding inside the badge
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3), // Badge position
            child: IconButton(
              icon: const Icon(BootstrapIcons.cart3),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCartScreen()));

              },
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: AppColor.bgColor,
        ), // Change drawer icon color here
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: storeServices.imageList.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.all(width / 98),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: height * 0.2,
                        autoPlay: true, // Enables auto sliding
                        autoPlayInterval:
                            const Duration(seconds: 2), // Time between slides
                        enlargeCenterPage: true, // Zooms in the centered image
                        aspectRatio: 16 / 9,
                        viewportFraction:
                            0.8, // Controls the size of each image
                      ),
                    ),
                    Gap(height * 0.01),
                    Row(
                      children: [
                        Text(
                          'New Day, New Vouchers!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height / 50),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text('More Vouchers'),
                              Gap(height * 0.01),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 50,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          overlayColor: const WidgetStatePropertyAll(
                              AppColor.primaryColor),
                          onTap: () {},
                          child: Container(
                            width: width * 0.31,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                              color: AppColor.medColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(height / 94),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '20% OFF',
                                    style: TextStyle(
                                      fontSize: height / 57,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Store Voucher',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: height / 77,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: width * 0.31,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                              color: AppColor.medColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height / 80),
                                      child: DottedLine(
                                        direction:
                                            Axis.vertical, // Vertical line
                                        lineLength: height *
                                            0.045, // Length of the line
                                        lineThickness: width * 0.0035,
                                        dashLength: height * 0.006,
                                        dashColor: const Color(0xfff48fb1),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(height / 94),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '$currency.500',
                                            style: TextStyle(
                                              fontSize: height / 57,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Free Shipping',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: height / 77,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 70),
                                  child: DottedLine(
                                    direction: Axis.vertical, // Vertical line
                                    lineLength:
                                        height * 0.045, // Length of the line
                                    lineThickness: width * 0.0035,
                                    dashLength: height * 0.006,
                                    dashColor: const Color(0xfff48fb1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: width * 0.31,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                              color: AppColor.medColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: width * 0.2,
                                  height: height * 0.035,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: AppColor.gradientColor),
                                  child: const Center(
                                    child: Text(
                                      'Collect',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height / 40),
                        ),
                        // const Spacer(),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute
                        //           (builder: (builder) => AllCategoriesScreen()));
                        //   },
                        //   child: Row(
                        //     children: [
                        //       const Text('All Categories'),
                        //       Gap(width / 98),
                        //       Icon(
                        //         Icons.arrow_forward_ios,
                        //         size: height / 49,
                        //         color: AppColor.typographyColor,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.15,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: storeServices.categoryList.length,
                          itemBuilder: (context, index) {

                            return Padding(
                              padding: EdgeInsets.all(width / 98),
                              child: ReuseContainer(
                                imagePath:
                                    storeServices.categoryList[index].imagePath,
                                text: storeServices.categoryList[index].title,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) =>
                              AppColor.gradientColor.createShader(bounds),
                          child: Text(
                            'FlashSale',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: height / 40),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text('Shop more'),
                              Gap(width / 98),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 49,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SaleProductCardList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) =>
                              AppColor.gradientColor.createShader(bounds),
                          child: Text(
                            'Top Deals',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: height / 40),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text('Shop more'),
                              Gap(width / 98),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 49,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.26,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width / 90.8,vertical: height /161.6),
                        child: TopDealsCardList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Watches',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height / 40),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text('Shop more'),
                              Gap(width / 98),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 49,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.36,
                      child: ItemsDisplay(),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Watches',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height / 40),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text('Shop more'),
                              Gap(width / 98),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 49,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.42,
                      child: ProductCardList(),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Watches',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height / 40),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              const Text('Shop more'),
                              Gap(width / 98),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 49,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.46,
                      child: ProductPageFour(),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Watches',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height / 40),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text('Shop more'),
                              Gap(width / 98),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 49,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.5,
                      child: ProductPage(),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400
                        .withOpacity(0.2), // Shadow for depth
                    spreadRadius: width / 200,
                    blurRadius: width / 98,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 110),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Watches',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height / 40),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text('Shop more'),
                              Gap(width / 98),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: height / 49,
                                color: AppColor.typographyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(height * 0.01),
                    SizedBox(
                      height: height * 0.44,
                      child: ProductPageTwo(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
