import 'package:store_app/data/Services/WpServices.dart';

import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.bgColor),
        ),
        centerTitle: true,
        actions: [
          badges.Badge(
            showBadge: true,
            badgeContent: Consumer<CartProvider>(
              builder: (BuildContext context, CartProvider provider, Widget? child) {
                return Text(
                  provider.cartItems.length.toString(), // Number to display on the badge
                  style: const TextStyle(color: Colors.white), // Badge text style
                );
              },
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(3),
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            child: IconButton(
              icon: const Icon(BootstrapIcons.cart3),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => AddToCartScreen()),
                );
              },
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: AppColor.bgColor),
      ),
      drawer: const MyDrawer(),
      body: Consumer<FavouriteItems>(
        builder: (context, favouriteItems, child) {
          // Filter products by their ID from the list of favorites
          List<ProductsDetail> favouriteProducts = WpServices.products
              .where((product) => favouriteItems.selectedItems.any((fav) => fav.id == product.id))
              .toList();

          if (favouriteProducts.isEmpty) {
            return const Center(child: Text('No favorite items yet.'));
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (width / 2.4) / (height * 0.35),
            ),
            itemCount: favouriteProducts.length,
            itemBuilder: (context, index) {
              final product = favouriteProducts[index];

              final String categoryName = product.categories?.isNotEmpty == true
                  ? product.categories![0].name ?? "Unknown Category"
                  : "Unknown Category";

              final double discountPercentage = calculateDiscountPercentage(
                product.regularPrice ?? '0',
                product.price,
              );

              return CustomProductCard(
                id: product.id,
                quantity: product.stockQuantity,
                productName: product.name ?? 'Unknown Product',
                oldPrice: product.regularPrice ?? '0',
                newPrice: product.price ?? '0',
                discountPercentage: double.parse(discountPercentage.toStringAsFixed(1)),
                ratingCount: product.averageRating.toString(),
                imagePath: product.images![0].src!.replaceAll('localhost', '192.168.18.52'),
                category: categoryName,
              );
            },
          );
        },
      ),
    );
  }

  double calculateDiscountPercentage(String regularPrice, String? salePrice) {
    if (salePrice != null && salePrice.isNotEmpty && regularPrice.isNotEmpty) {
      double regular = double.tryParse(regularPrice) ?? 0.0;
      double sale = double.tryParse(salePrice) ?? 0.0;

      if (regular > 0) {
        return ((regular - sale) / regular) * 100;
      }
    }
    return 0;
  }
}

