import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Export/export_dev.dart';

class Checkout1Address extends StatelessWidget {
  const Checkout1Address({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColor.black,
                      ),
                      Text(
                        "Address",
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
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5),
                    child: Divider(
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  const Text(
                    "Saved Address",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: AppFontSizes.h7,
                      fontWeight: AppFontWeights.weightBold,
                    ),
                  ),
                  Gap(10),
                  addressBox(
                      name: "Home",
                      address: "925 S Chugach St # APT 10,Alaska 99645",
                      data: Icons.circle),
                  const Gap(5),
                  addressBox(
                      name: "Home",
                      address: "925 S Chugach St # APT 10,Alaska 99645",
                      data: Icons.circle_outlined),
                  const Gap(10),
                  addressBox(
                      name: "Home",
                      address: "925 S Chugach St # APT 10,Alaska 99645",
                      data: Icons.circle_outlined),
                  const Gap(10),
                  addressBox(
                      name: "Home",
                      address: "925 S Chugach St # APT 10,Alaska 99645",
                      data: Icons.circle_outlined),
                  const Gap(10),
                ],
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
                  'Apply',
                  style: TextStyle(fontSize: 14, color: AppColor.bgColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addressBox({String? name, String? address, required IconData data}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.grey)),
      child: Center(
        child: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColor.black,
              size: 22,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: AppFontSizes.p2,
                      fontWeight: AppFontWeights.weightMedium,
                    ),
                  ),
                  Text(
                    address!,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: AppFontSizes.p3,
                      fontWeight: AppFontWeights.weightNormal,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              data,
              color: AppColor.black,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
