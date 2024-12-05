import 'package:store_app/data/Services/WpServices.dart';

import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';


class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  List<CategoryModel> parentCategories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    List<CategoryModel> allCategories = await WpServices.getCategories();
    setState(() {
      // Filter parent categories (parent == 0)
      parentCategories =
          allCategories.where((category) => category.parent == 0).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: AppColor.bgColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(BootstrapIcons.cart3),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCartScreen()));
            },
          ),
        ],

        iconTheme: const IconThemeData(
            color: AppColor.bgColor), // Change drawer icon color here
      ),
      drawer: CategoryListDrawer(),

    );
  }
}
