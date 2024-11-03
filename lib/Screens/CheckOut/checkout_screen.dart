import 'package:flutter/material.dart';

import '../../Export/export_dev.dart';

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

        iconTheme: const IconThemeData(
            color: AppColor.bgColor),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.77,
            child: Column(
              children: [
                const Divider(),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder) => const AddressScreen()));
                  },
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
                const Divider(),
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
