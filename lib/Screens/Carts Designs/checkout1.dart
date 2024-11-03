import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';
import 'cart1.dart';

class Checkout1 extends StatelessWidget {
  const Checkout1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: AppColor.black,
                    ),
                    Text(
                      "Checkout",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: AppFontSizes.h5,
                        fontWeight: AppFontWeights.weightBold,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.bell,
                      color: AppColor.black,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
                DeliveryAddress(),
                PaymentMethod(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// DELIVERY ADDRESS
class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Address",
              style: TextStyle(
                color: AppColor.black,
                fontSize: AppFontSizes.h7,
                fontWeight: AppFontWeights.weightBold,
              ),
            ),
            Text(
              "Change",
              style: TextStyle(
                color: AppColor.black,
                fontSize: AppFontSizes.p1,
                fontWeight: AppFontWeights.weightNormal,
              ),
            ),
          ],
        ),
        Gap(10),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColor.black,
                  size: 22,
                ),
                Gap(5),
                Text(
                  "Home",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: AppFontSizes.p2,
                    fontWeight: AppFontWeights.weightMedium,
                  ),
                ),
              ],
            ),
            Text(
              "925 S Chugach St # APT 10,Alaska 99645",
              style: TextStyle(
                color: AppColor.black,
                fontSize: AppFontSizes.p3,
                fontWeight: AppFontWeights.weightNormal,
              ),
            ),
          ],
        ),
        Gap(10),
        Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5),
          child: Divider(
            indent: 5,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}

//PAYMENT METHOD
class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Method",
          style: TextStyle(
            color: AppColor.black,
            fontSize: AppFontSizes.h7,
            fontWeight: AppFontWeights.weightBold,
          ),
        ),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                height: 35,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.black,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.payment,
                      color: AppColor.bgColor,
                      size: 22,
                    ),
                    Gap(5),
                    Text(
                      "Card",
                      style: TextStyle(
                        color: AppColor.bgColor,
                        fontSize: AppFontSizes.p3,
                        fontWeight: AppFontWeights.weightMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 35,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.grey.withOpacity(0.5)),
                  color: AppColor.bgColor,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      BootstrapIcons.currency_dollar,
                      color: AppColor.black,
                      size: 22,
                    ),
                    Gap(5),
                    Text(
                      "Cash",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: AppFontSizes.p3,
                        fontWeight: AppFontWeights.weightMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 35,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.grey.withOpacity(0.5)),
                  color: AppColor.bgColor,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apple,
                      color: AppColor.black,
                      size: 22,
                    ),
                    Gap(5),
                    Text(
                      "Pay",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: AppFontSizes.p3,
                        fontWeight: AppFontWeights.weightMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Gap(10),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.grey)),
          child: const Center(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "********** 2512",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 15.0, right: 10.0),
                    child: Text(
                      "VISA",
                      style: TextStyle(
                          fontSize: AppFontSizes.p1,
                          fontWeight: AppFontWeights.weightBold,
                          color: AppColor.black),
                    ),
                  ),
                  suffixIcon: Icon(Icons.edit)),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5),
          child: Divider(
            indent: 5,
            endIndent: 5,
          ),
        ),
        SizedBox(
          height: height / 3.5,
          // color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Summary",
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: AppFontSizes.h7,
                  fontWeight: AppFontWeights.weightBold,
                ),
              ),
              calculationItems("Sub-Total", "$currency 5,870"),
              calculationItems("VAT(%)", "$currency 0"),
              calculationItems("Shipping fee", "$currency 80"),
              const Divider(
                color: Colors.grey,
                indent: 10,
                endIndent: 10,
              ),
              calculationItems("Sub-Total", "$currency 5,950"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 10),
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.grey)),
                      child: const Center(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Enter Promo Code",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              prefixIcon: Icon(
                                Icons.discount_outlined,
                                size: 20,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.black,
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 14, color: AppColor.bgColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 45,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.black,
          ),
          child: const Text(
            'Place Order',
            style: TextStyle(fontSize: 14, color: AppColor.bgColor),
          ),
        ),
      ],
    );
  }
}
