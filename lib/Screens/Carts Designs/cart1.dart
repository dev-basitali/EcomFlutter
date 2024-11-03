import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/Common/Utils/app_colors.dart';
import 'package:store_app/Export/export_dev.dart';
import 'package:store_app/Screens/Carts%20Designs/components/cartitemwidget.dart';

class Cart1 extends StatelessWidget {
  const Cart1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('My Cart'),
        actions: const [
          Icon(CupertinoIcons.bell),
          Gap(20),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CartItemWidget(index: index),
                      );
                    }),
              ),
              SizedBox(
                height: height / 4.2,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calculationItems("Sub-Total", "$currency 5,870"),
                    calculationItems("VAT(%)", "$currency 0"),
                    calculationItems("Shipping fee", "$currency 80"),
                    const Divider(
                      color: Colors.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    calculationItems("Sub-Total", "$currency 5,950"),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 40,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.black,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Go to Checkout',
                            style: TextStyle(
                                fontSize: 14, color: AppColor.bgColor),
                          ),
                          Gap(10),
                          Icon(CupertinoIcons.arrow_right,
                              color: AppColor.bgColor)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget calculationItems(String title, String price) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, color: AppColor.grey),
        ),
        const Gap(15),
        Text(
          price,
          style: const TextStyle(
              fontSize: 15, color: AppColor.black, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
