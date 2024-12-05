import 'package:flutter/material.dart';
import 'package:store_app/Screens/Carts%20Designs/checkout1address.dart';
import '../../Export/export_dev.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _currentIndex = 0;
  bool isSearching = false;

  final List<Widget> _screens = [
    // const HomeScreen(),
    const HomeScreen(),
    const ProductsScreen(),
    const FavoriteScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.naturalColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.symmetric(
            horizontal: width / 100, vertical: height / 150),
        backgroundColor: AppColor.typographyColor,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(
              BootstrapIcons.house,
            ),
            title: const Text("Home"),
            selectedColor: AppColor.primaryColor,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(
              BootstrapIcons.grid,
            ),
            title: const Text("Products"),
            selectedColor: Colors.indigo,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              BootstrapIcons.heart,
            ),
            title: const Text("Favorite"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(
              BootstrapIcons.chat_dots,
            ),
            title: const Text("Messages"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(
              BootstrapIcons.person,
            ),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
