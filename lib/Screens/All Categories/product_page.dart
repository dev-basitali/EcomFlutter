
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../../Export/export_dev.dart';


class ProductListScreen extends StatefulWidget {
  final CategoryModel category;

  const ProductListScreen({super.key, required this.category});

  @override
  ProductListScreenState createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {

  List<ProductsDetail> products = [];
  bool isLoading = true; // State variable to track loading

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    // Fetch all products
    List<ProductsDetail> allProducts = await WpServices.getProducts();
    setState(() {
      // Filter products based on the selected category
      products = allProducts
          .where((product) => product.categories![0].id == widget.category.id)
          .toList();
      isLoading = false; // Update loading state when done
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.name ?? 'Products',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: AppColor.bgColor),
        ),
        centerTitle: true,
        actions: [
          badges.Badge(
            showBadge: true,
            badgeContent: Consumer<CartProvider>(
              builder: (BuildContext context, CartProvider provider, Widget? child)
              {
                return Text(
                  provider.cartItems.length.toString(), // Number to display on the badge
                  style: const TextStyle(color: Colors.white), // Badge text style
                );
              },
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red, // Customize badge background color
              padding: EdgeInsets.all(3), // Padding inside the badge
            ),
            position: badges.BadgePosition.topEnd(top: 0, end: 3), // Badge position
            child: IconButton(
              icon: const Icon(BootstrapIcons.cart3),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => AddToCartScreen()));

              },
            ),
          ),
        ],
        iconTheme: const IconThemeData(
            color: AppColor.bgColor), // Change drawer icon color here
      ),
      body: isLoading // Check if still loading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty // Check if no products available
              ? Center(
                  child: Text(
                    'No products available in this category.',
                    style: TextStyle(fontSize: height/ 50.5, fontWeight: FontWeight.bold),
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (width / 2.6) / (height * 0.36),
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    ProductsDetail product = products[index];
                    double discountPercentage = calculateDiscountPercentage(
                      product.regularPrice.toString(),
                      product.price,
                    );

                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 500),
                            reverseTransitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
                              opacity: animation,
                              child: ProductDetailPage( product: WpServices.products[index], id: WpServices.products[index].id!,
                              ),
                            ),
                          ),
                        );
                      },
                      child: CustomProductCard(
                        id: product.id,
                        productName: product.name,
                        oldPrice: product.regularPrice,
                        newPrice: product.price,
                        discountPercentage:
                            double.parse(discountPercentage.toStringAsFixed(1)),
                        ratingCount: product.averageRating.toString(),
                        imagePath: product.images!.isNotEmpty
                            ? product.images![0].src!.replaceAll('localhost',
                                '192.168.18.52') // Replace 'localhost' with your IP address
                            : 'https://example.com/default_image.png',
                        category: product.categories![0].name,
                      ),
                    );
                  },
                ),
    );
  }

  double calculateDiscountPercentage(String regularPrice, String? salePrice) {
    // Check if salePrice is not null or empty and regularPrice is a valid number
    if (salePrice != null && salePrice.isNotEmpty && regularPrice.isNotEmpty) {
      double regular = double.tryParse(regularPrice) ?? 0.0;
      double sale = double.tryParse(salePrice) ?? 0.0;

      // Calculate the discount percentage
      if (regular > 0) {
        return ((regular - sale) / regular) * 100;
      }
    }
    return 0; // Return 0 if not on sale or invalid prices
  }
}
