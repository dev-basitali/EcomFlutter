import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Common/Utils/app_colors.dart';

class CartItemWidget extends StatelessWidget {
  final int index;
  const CartItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      height: height / 7,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: height / 8.8,
                width: width / 5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mobile.png'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Regular Fit Slagon",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColor.black),
                        ),
                        Text(
                          "size L",
                          style: TextStyle(fontSize: 15, color: AppColor.black),
                        ),
                      ],
                    ),
                    Text(
                      r"$ 1,190",
                      style: TextStyle(fontSize: 15, color: AppColor.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                CupertinoIcons.delete,
                color: AppColor.red,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.all(2.5),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Icon(
                      CupertinoIcons.minus,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  const Text(
                    " 1 ",
                    style: TextStyle(fontSize: 15, color: AppColor.black),
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.all(2.5),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Icon(
                      CupertinoIcons.plus,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
