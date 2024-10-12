import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:store_app/Common/Utils/app_colors.dart';
import '../Favorite/favorite_screen.dart';
import '../Home Screen/home_screen.dart';
import '../Messages/messages_screen.dart';
import '../Products/products_screen.dart';
import '../User Profile/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _currentIndex = 0;
  bool isSearching = false;

  final List<Widget> _screens = [
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
      backgroundColor: AppColor.naturalColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.symmetric(horizontal:  width / 100,vertical: height / 150),
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
