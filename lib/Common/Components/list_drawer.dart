import 'package:flutter/material.dart';

import '../../Model/category_model.dart';
import '../../Model/category_service.dart';
import '../../Screens/All Categories/product_page.dart';
import '../Utils/app_colors.dart';

class CategoryListDrawer extends StatefulWidget {
  const CategoryListDrawer({super.key});

  @override
  State<CategoryListDrawer> createState() => _CategoryListDrawerState();
}

class _CategoryListDrawerState extends State<CategoryListDrawer> {
  final CategoryService categoryService = CategoryService();
  List<CategoryModel> parentCategories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    List<CategoryModel> allCategories = await categoryService.getCategories();
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


      return Drawer(
        child: Scaffold(
          body: parentCategories.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: parentCategories.length,
                itemBuilder: (context, index) {
                  CategoryModel parentCategory = parentCategories[index];
                  List<CategoryModel> childCategories = categoryService
                      .categories
                      .where(
                          (category) => category.parent == parentCategory.id)
                      .toList();
                  return ExpansionTile(
                    title: Text(parentCategory.name ?? '',
                      style: TextStyle(
                          color: AppColor.typographyColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    children: childCategories.map((children) {
                      return ListTile(
                        title: TextButton(
                          onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductListScreen(category: children),
                          ),
                        ); }, child: Row(
                          children: [
                            Text(children.name ?? '',
                            style: TextStyle(
                                color: AppColor.typographyColor
                            ),
                          ),
                          ],
                        ),),
                      );
                    }).toList(),
                  );
                },
              ),
        ),
      );
    }
  }
