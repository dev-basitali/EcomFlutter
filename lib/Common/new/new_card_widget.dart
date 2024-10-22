import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Common/Utils/app_colors.dart';
import '../../Model/products_model.dart';
import '../../Provider/favourite_provider.dart';
import '../../Screens/Product Details/product_details.dart';
import 'new_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductsModel productsModel = ProductsModel();

  @override
  void initState() {

    productsModel.getProducts;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItems>(context);

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: FutureBuilder(
        future: productsModel.getProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productsModel.products.length,
                itemBuilder: (context, index) {
                  final product = productsModel.products[index];

                  final String imagePath = product.images?.isNotEmpty == true
                      ? product.images![0].src!.replaceAll('localhost', '192.168.18.52') // Replace 'localhost' with your IP address
                      : 'https://example.com/default_image.png';

                  final String categoryName = product.categories?.isNotEmpty == true
                      ? product.categories![0].name ?? "Unknown Category"
                      : "Unknown Category";

                  final double discountPercentage = calculateDiscountPercentage(
                    product.price?.toString() ?? '0',
                    product.price,
                  );

                  return InkWell(
                    onTap: () {
                      provider.id = product.id!;
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
                            opacity: animation,
                            child: ProductDetailPage(
                              product: product, id: provider.id,

                            ),
                          ),
                        ),
                      );
                    },
                    child: CustomProductCard(
                      id: product.id,
                      quantity: product.stockQuantity,
                      productName: product.name ?? 'Unknown Product',
                      oldPrice: product.regularPrice ?? '0',
                      newPrice: product.price ?? '0',
                      discountPercentage: double.parse(discountPercentage.toStringAsFixed(1)),
                      ratingCount: product.averageRating.toString(),
                      imagePath: imagePath,
                      category: categoryName,
                    ),
                  );
                },
              ),
            );
          }
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
