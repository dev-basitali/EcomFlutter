import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Common/Utils/AppFontSizes.dart';
import '../../../Common/Utils/appFontWeights.dart';
import '../../../Common/Utils/app_colors.dart';
import '../../../main.dart';

class Cart2ItemWidget extends StatelessWidget {
  final int index;
  const Cart2ItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Container(
      height: height / 6.7,
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: height / 8.8,
                width: width / 3.7,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ]),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/mobile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.bgColor,
                        ),
                        child: const Icon(
                          CupertinoIcons.delete,
                          color: AppColor.red,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet,\n consectetur",
                      style: TextStyle(
                          fontSize: AppFontSizes.p3,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black),
                    ),
                    const Text(
                      "Pink, size L",
                      style: TextStyle(
                          fontSize: AppFontSizes.p2,
                          fontWeight: AppFontWeights.weightMedium,
                          color: AppColor.black),
                    ),
                    SizedBox(
                      width: width / 1.8,
                      // color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "$currency 1,790",
                            style: TextStyle(
                                fontSize: AppFontSizes.h5,
                                color: AppColor.black,
                                fontWeight: AppFontWeights.weightBold),
                          ),
                          // Gap(100),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.zero,
                                padding: const EdgeInsets.all(2.5),
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColor.primaryColor),
                                ),
                                child: const Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.black,
                                  size: 14,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                padding: const EdgeInsets.all(2.5),
                                height: 28,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  " 1 ",
                                  style: TextStyle(
                                      fontSize: AppFontSizes.p2,
                                      fontWeight: AppFontWeights.weightMedium,
                                      color: AppColor.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.zero,
                                padding: const EdgeInsets.all(2.5),
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColor.primaryColor),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
