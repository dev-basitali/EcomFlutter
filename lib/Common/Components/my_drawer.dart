import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import '../../Screens/Bottom Navigation/bottom_navigation.dart';
import '../Utils/app_colors.dart';
import 'list_drawer.dart'; // Ensure to import the CategoryListDrawer

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _showCategoryList = false; // State variable to toggle category view

  void _toggleCategoryList() {
    setState(() {
      _showCategoryList = !_showCategoryList; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.65,
      child: Drawer(
        child: Scaffold(
          backgroundColor: AppColor.bgColor,
          appBar: AppBar(
            title: Text(
              _showCategoryList ? 'Categories' : 'My App', // Change title based on view
              style: const TextStyle(
                color: AppColor.bgColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (_showCategoryList) {
                    _toggleCategoryList(); // Go back to main drawer
                  } else {
                    Navigator.pop(context); // Close the drawer
                  }
                },
                icon: const Icon(
                  BootstrapIcons.x,
                  color: AppColor.bgColor,
                ),
              )
            ],
          ),
          body: _showCategoryList
              ? const CategoryListDrawer() // Show Category List Drawer
              : ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const BottomNavigation(),
                    ),
                  );
                },
                child: const ListTile(
                  leading: Icon(BootstrapIcons.house),
                  title: Text('Home'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: _toggleCategoryList, // Show categories
                child: const ListTile(
                  leading: Icon(BootstrapIcons.list_check),
                  title: Text('Categories'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(BootstrapIcons.gear_fill),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
