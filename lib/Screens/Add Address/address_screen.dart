import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';


class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController orderNotesController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? selectedState;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    Provider.of<CheckOutProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shipping Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: companyController,
                decoration: InputDecoration(
                  labelText: 'Company name (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              // SizedBox(height: 16),
              // DropdownButtonFormField<String>(
              //   decoration: InputDecoration(
              //     labelText: 'Country / Region *',
              //     border: OutlineInputBorder(),
              //   ),
              //   items: ['Pakistan', 'Other Country'].map((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //   onChanged: (_) {},
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please select your country/region';
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(height: 16),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Street address *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your street address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'Town / City *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Consumer<CheckOutProvider>(
                builder: (BuildContext context, CheckOutProvider provider, Widget? child) {
                  return  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'State / County *',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      'Punjab',
                      'Sindh',
                      'Khyber Pakhtunkhwa',
                      'Baluchistan',
                      'Islamabad Capital Territory',
                      'Gilgit-Baltistan',
                      'Azad Jammu and Kashmir'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      provider.setSelectedState(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your state';
                      }
                      return null;
                    },
                  );
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: postCodeController,
                decoration: InputDecoration(
                  labelText: 'Postcode / ZIP *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your postcode/ZIP';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone *',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email address *',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: orderNotesController,
                decoration: InputDecoration(
                  labelText: 'Order notes (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Consumer<CheckOutProvider>(
                builder: (BuildContext context, CheckOutProvider provider,
                    Widget? child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Create a ShippingAddress instance
                        final shippingAddress = ShippingAddress(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          address1: addressController.text,
                          city: cityController.text,
                          state: selectedState ?? '',
                          postcode: postCodeController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );

                        // Add the shipping address to the checkoutProvider
                        provider.addShippingAddress(shippingAddress);
                        for (var address in provider.getShippingAddress) {
                          print("Shipping Address: ${address.toJson()}");
                        }

                        // Clear the form fields
                        firstNameController.clear();
                        lastNameController.clear();
                        companyController.clear();
                        addressController.clear();
                        cityController.clear();
                        postCodeController.clear();
                        phoneController.clear();
                        emailController.clear();
                        orderNotesController.clear();
                        selectedState = '';

                        Navigator.push(context, MaterialPageRoute(builder: (builder) => SelectPaymentMethodScreen()));
                        // Call the createOrder function
                        // provider.addShippingAddress(shippingAddress).then((_) {
                        //   // Optionally show success feedback
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text('Order created successfully!')),
                        //   );
                        // }).catchError((error) {
                        //   // Optionally show error feedback
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text('Failed to create order: $error')),
                        //   );
                        // });
                      }
                    },
                    child: Text('Submit'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
