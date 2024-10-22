import 'package:flutter/material.dart';

import '../../Common/Utils/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.bgColor
          ),),
        centerTitle: true,
        // actions: [
        //   badges.Badge(
        //     showBadge: true,
        //     badgeContent: Consumer<CartProvider>(
        //       builder: (BuildContext context, CartProvider provider, Widget? child)
        //       {
        //         return Text(
        //           provider.cartItems.length.toString(), // Number to display on the badge
        //           style: const TextStyle(color: Colors.white), // Badge text style
        //         );
        //       },
        //     ),
        //     badgeStyle: const badges.BadgeStyle(
        //       badgeColor: Colors.red, // Customize badge background color
        //       padding: EdgeInsets.all(3), // Padding inside the badge
        //     ),
        //     position: badges.BadgePosition.topEnd(top: 0, end: 3), // Badge position
        //     child: IconButton(
        //       icon: const Icon(BootstrapIcons.cart3),
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCartScreen()));
        //
        //       },
        //     ),
        //   ),
        // ],
        iconTheme: const IconThemeData(
            color: AppColor.bgColor),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.8,
            child: Column(
              children: [
                Divider(),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: AppColor.typographyColor,),
                        Text('Add Address'),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Total Price'),
              Spacer(),
              ElevatedButton(onPressed: (){}, child: Text('Pay Now'))
            ],
          )
        ],
      ),
    );
  }
}
