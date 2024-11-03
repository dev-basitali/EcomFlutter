// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../Common/Utils/AppFontSizes.dart';
// import '../../Common/Utils/appFontWeights.dart';
// import '../../Common/Utils/app_colors.dart';
//
// class Checkout2 extends StatelessWidget {
//   const Checkout2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//         child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(
//               Icons.arrow_back,
//               color: AppColor.black,
//             ),
//             Text(
//               "Checkout",
//               style: TextStyle(
//                 color: AppColor.black,
//                 fontSize: AppFontSizes.h5,
//                 fontWeight: AppFontWeights.weightBold,
//               ),
//             ),
//             Icon(
//               CupertinoIcons.cart,
//               color: AppColor.black,
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';

class CheckoutScreen2 extends StatefulWidget {
  const CheckoutScreen2({super.key});

  @override
  State<CheckoutScreen2> createState() => _CheckoutScreen2State();
}

class _CheckoutScreen2State extends State<CheckoutScreen2> {
  TextEditingController controller = new TextEditingController();
  int _currentStep = 0;

  void _nextStep() {
    setState(() {
      if (_currentStep < 2) _currentStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // APPBAR WIDGET DESIGN
              _buildAppBar(),
              // STEPS INDICATOR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStepIcon(Icons.local_shipping, "Shipping", 0),
                    _buildStepLine(1),
                    _buildStepIcon(Icons.payment, "Payment", 1),
                    _buildStepLine(2),
                    _buildStepIcon(Icons.receipt, "Review", 2),
                  ],
                ),
              ),
              const Gap(15),
              // STEPS CONTENT
              Flexible(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    if (_currentStep == 0) _buildShippingContent(),
                    if (_currentStep == 1) _buildPaymentContent(),
                    if (_currentStep == 2) _buildReviewContent(),
                  ],
                ),
              ),

              // const Spacer(),

              // Next Button
              Center(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.sizeOf(context).width / 1.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.black,
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 14, color: AppColor.bgColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
             onPressed: () {
                Navigator.pop(context);
            }, icon: const Icon( Icons.arrow_back,
              color: AppColor.black,),
            ),
            const Text(
              "Checkout",
              style: TextStyle(
                color: AppColor.black,
                fontSize: AppFontSizes.h5,
                fontWeight: AppFontWeights.weightBold,
              ),
            ),
            const Icon(
              CupertinoIcons.cart,
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
      ],
    );
  }

  Widget _buildStepIcon(IconData icon, String label, int step) {
    return Column(
      children: [
        Icon(
          icon,
          color: _currentStep >= step ? Colors.black : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            color: _currentStep >= step ? Colors.black : Colors.grey,
            fontWeight:
                _currentStep >= step ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(int step) {
    return Expanded(
      child: Divider(
        color: _currentStep >= step ? Colors.black : Colors.grey,
        thickness: 1,
        indent: 10,
        endIndent: 10,
      ),
    );
  }

  Widget _buildShippingContent() {
    return Column(
      children: [
        const Text(
          "Enter Shipping Details",
          style: TextStyle(
            color: AppColor.black,
            fontSize: AppFontSizes.p1,
            fontWeight: AppFontWeights.weightMedium,
          ),
        ),
        const Gap(15),
        _buildTextField(controller,"Full Name*", "Enter Full Name"),
        const SizedBox(height: 16),
        _buildTextField(controller,"Phone Number*", "+92", isPhoneNumber: true),
        const SizedBox(height: 16),
        _buildDropdown("Select Province"),
        const SizedBox(height: 16),
        _buildDropdown("Select City"),
        const SizedBox(height: 16),
        _buildTextField(controller,"Street Address*", "Enter street address"),
        const SizedBox(height: 16),
        _buildTextField(controller,"Postal Code*", "Enter postal code"),
      ],
    );
  }

  Widget _buildPaymentContent() {
    return const Text("Payment details here...");
  }

  Widget _buildReviewContent() {
    return const Text("Review your order here...");
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint,
      {bool isPhoneNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            label,
            style: const TextStyle(
              color: AppColor.black,
              fontSize: AppFontSizes.p2,
              fontWeight: AppFontWeights.weightMedium,
            ),
          ),
        ),
        const Gap(5),
        Container(
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              isDense: true,
            ),
            keyboardType:
                isPhoneNumber ? TextInputType.phone : TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      height: 40,
      // alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: DropdownButtonFormField<String>(
        // itemHeight: 40,
        icon: const Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.arrow_drop_down,
              size: 24,
            )),
        // padding: const EdgeInsets.only(top: 10),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 7),
          border: InputBorder.none,
        ),
        alignment: Alignment.center,
        items: <String>['Option 1', 'Option 2', 'Option 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            alignment: Alignment.topCenter,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $hint';
          }
          return null;
        },
      ),
    );
  }
}
