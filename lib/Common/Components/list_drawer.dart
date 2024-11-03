import 'package:flutter/material.dart';
import '../../Export/export_dev.dart';

class CategoryListDrawer extends StatefulWidget {
  const CategoryListDrawer({super.key});

  @override
  State<CategoryListDrawer> createState() => _CategoryListDrawerState();
}

class _CategoryListDrawerState extends State<CategoryListDrawer> {

  List<CategoryModel> parentCategories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

// Filter parent categories (parent == 0)
  Future<void> fetchCategories() async {
    List<CategoryModel> allCategories = await WpServices.getCategories();
    setState(() {
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
            // ParentCategories List View Builder
            : ListView.builder(
                itemCount: parentCategories.length,
                itemBuilder: (context, index) {
                  CategoryModel parentCategory = parentCategories[index];
                  List<CategoryModel> childCategories = WpServices
                      .categories
                      .where((category) => category.parent == parentCategory.id)
                      .toList();
                  return ExpansionTile(
                    title: Text(
                      parentCategory.name ?? '',
                      style: TextStyle(
                          color: AppColor.typographyColor,
                          fontWeight: FontWeight.bold),
                    ),
                    // Mapping Child Categories
                    children: childCategories.map(
                      (children) {
                        return ListTile(
                          title: TextButton(
                            onPressed: () {
                              // Navigate to Product List Screen with selected category as argument
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductListScreen(category: children),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  children.name ?? '',
                                  style: TextStyle(
                                      color: AppColor.typographyColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
      ),
    );
  }
}
