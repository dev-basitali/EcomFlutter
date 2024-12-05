import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Common/Utils/AppFontSizes.dart';
import 'package:store_app/Export/export_dev.dart';
import 'package:store_app/Screens/Carts%20Designs/components/cart2itemswidget.dart';
import '../../Common/Utils/appFontWeights.dart';
import '../../Common/Utils/appStyling.dart';
import '../../Common/Utils/app_colors.dart';
import 'components/wishlistitemwidget.dart';

class Cart2 extends StatelessWidget {
  const Cart2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Cart ",
                            style: TextStyle(
                              fontSize: AppFontSizes.h3,
                              fontWeight: AppFontWeights.weightBold,
                              color: AppColor.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryColor.withOpacity(0.3),
                            ),
                            child: const Text(
                              "2",
                              style: TextStyle(
                                fontSize: AppFontSizes.h3,
                                fontWeight: AppFontWeights.weightBold,
                                color: AppColor.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: height / 9,
                        width: width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                          // border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Shipping Address",
                              style: TextStyle(
                                  fontSize: AppFontSizes.h7,
                                  color: AppColor.black,
                                  fontWeight: AppFontWeights.weightBold),
                            ),
                            Row(
                              children: [
                                const Flexible(
                                  child: Text(
                                    "26, Duong So 2, Thao dien Ward,An Phu, District 2,Ho Chi Minh City",
                                    style: TextStyle(
                                        fontSize: AppFontSizes.p4,
                                        color: AppColor.black,
                                        fontWeight:
                                            AppFontWeights.weightNormal),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: AppColor.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.pen,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Cart2ItemWidget(index: index);
                          }),
                      const Gap(10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "From Your Wishlist ",
                          style: TextStyle(
                            fontSize: AppFontSizes.h3,
                            fontWeight: AppFontWeights.weightBold,
                            color: AppColor.black,
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return WishListItemWidget(index: index);
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.grey.withAlpha(1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total $currency 34,00",
                      style: TextStyle(
                          fontSize: AppFontSizes.h5,
                          fontWeight: AppFontWeights.weightBold,
                          color: AppColor.black),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 45,
                      alignment: Alignment.center,
                      width: width / 2.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primaryColor,
                      ),
                      child: const Text(
                        'Go to Checkout',
                        style: TextStyle(fontSize: 14, color: AppColor.bgColor),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
