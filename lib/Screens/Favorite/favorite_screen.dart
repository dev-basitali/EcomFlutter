import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Common/Components/my_drawer.dart';
import '../../Common/Components/product_card.dart';
import '../../Common/Utils/app_colors.dart';
import '../../Model/lists_class.dart';
import '../../Provider/favourite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final StoreServices storeServices = StoreServices(); // Access store services



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Provider.of<FavouriteItems>(context,);
    return  Scaffold(
      appBar: AppBar(
        title:  const Text(
          'Favorite',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.bgColor
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(BootstrapIcons.cart3),
            onPressed: () {
              // Implement your cart functionality here
            },
          ),
        ],
        iconTheme: const IconThemeData(
            color: AppColor.bgColor), // Change drawer icon color here
      ),
      drawer: const MyDrawer(),
      body: Consumer<FavouriteItems>(
        builder: (context, favouriteItems, child) {
          // Get the favorite product IDs
          List<int> favouriteIds = favouriteItems.selectedItems;
      
          // Filter the products based on their ID
          List<Product> favouriteProducts = storeServices.products
              .where((product) => favouriteIds.contains(product.id))
              .toList();
      
          if (favouriteProducts.isEmpty) {
            return const Center(
              child: Text('No favorite items yet.'),
            );
          }
          return GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

              childAspectRatio: (width / 2.4) / (height * 0.35),
            ),
            itemCount: favouriteProducts.length,
            itemBuilder: (context, index) {
              final product = favouriteProducts[index];
              return ProductCard(
                imagePath: product.imagePath,
                price: product.price,
                productId: product.id,
                productName: product.productName,
                oldPrice: product.oldPrice,
                rating: product.rating,
              );
            },
          );
        },
      ),
    );
  }
}
