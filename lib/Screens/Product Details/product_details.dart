
import '../../Export/export_dev.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import '../../Model/variation_model.dart';



class ProductDetailPage extends StatefulWidget {
  final ProductsDetail product;
  final int id;

  const ProductDetailPage({super.key, required this.product, required this.id});

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  List<ProductReview> reviews = [];
  List<ProductVariation> productVariations = [];
  bool isLoading = true;
  bool isVariationLoading = true;
  ProductVariation? selectedVariation; // Track the selected variation
  ProductVariation? defaultVariation; // Track the default variation

  @override
  void initState() {
    super.initState();
    fetchProductReviews();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch variations in didChangeDependencies after the widget is fully inserted
    fetchProductVariations();
  }

  // Fetch reviews based on the product ID
  void fetchProductReviews() async {

    final fetchedReviews = await WpServices.getReviews(widget.product.id!);
    setState(() {
      reviews = fetchedReviews;
      isLoading = false;
    });
  }

  // Fetch product variations based on the product ID
  void fetchProductVariations() async {

    final fetchedVariations =
        await WpServices.fetchProductVariation(context);
    setState(() {
      productVariations = fetchedVariations;
      isVariationLoading = false;
      if (fetchedVariations.isEmpty) {
        defaultVariation = fetchedVariations.first; // Set the default variation
      }
    });
  }

// Get the list of image URLs from the selected variation or product, if available
  List<String> getAllVariationImages() {
    List<String> images = [];

    // If there's a selected variation and it has an image
    if (selectedVariation != null && selectedVariation!.image != null) {
      images.add(selectedVariation!.image!.src!
          .replaceAll('localhost', '192.168.18.52'));
    }

    // If the product itself has images, add them to the list
    if (widget.product.images != null && widget.product.images!.isNotEmpty) {
      images.addAll(widget.product.images!
          .map((image) => image.src!.replaceAll('localhost', '192.168.18.52'))
          .toList());
    }

    // If no images were found, add a placeholder image
    if (images.isEmpty) {
      images.add('https://via.placeholder.com/300');
    }

    return images;
  }

  String cleanDescription(String description) {
    final RegExp regex =
        RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return description.replaceAll(regex, '').trim();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final currentVariation = selectedVariation ?? defaultVariation;
    final cartProvider = Provider.of<CartProvider>(context,listen: false);
    print('data');
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        title: Text(
          product.name ?? "Product Detail",
          style: TextStyle(
            color: AppColor.bgColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
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
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Images Carousel
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SizedBox(
                          height: 300.0,
                          child: PageView.builder(
                            itemCount: product.images?.length ?? 1,
                            itemBuilder: (context, index) {
                              return Image.network(
                                getAllVariationImages()[index],
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Product Name
                      Text(
                        product.name ?? '',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (currentVariation != null) ...[
                                    if (currentVariation.salePrice != null &&
                                        currentVariation
                                            .salePrice!.isNotEmpty) ...[
                                      // Sale price with a struck-through regular price
                                      Text(
                                        "$currency${currentVariation.regularPrice}",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        "$currency${currentVariation.salePrice}",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ] else ...[
                                      // Only regular price if no sale price
                                      Row(
                                        children: [
                                          Text(
                                            "$currency${currentVariation.regularPrice}",
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]
                                  ]
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              // Rating and Total Sales
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20.0),
                                  SizedBox(width: 4),
                                  Text(
                                    product.averageRating.toString(),
                                    style: TextStyle(
                                      fontSize: height / 44.89,
                                    ),
                                  ),
                                  SizedBox(width: width / 45.4),
                                  Text(
                                    '(${product.ratingCount} reviews)',
                                    style: TextStyle(
                                        fontSize: height / 50.5,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: height / 20.2,
                                child: Material(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (quantity > 1) {
                                            quantity -= 1;
                                            setState(() {});
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: AppColor.bgColor,
                                          size: height / 40.4,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 113.5,
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height / 40.4),
                                      ),
                                      SizedBox(
                                        width: width / 113.5,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          quantity += 1;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: AppColor.bgColor,
                                          size: height / 40.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: height / 50.5),
                      // Product Categories
                      if (product.categories != null &&
                          product.categories!.isNotEmpty)
                        Row(
                          children: [
                            Text(
                              'Categories: ',
                              style: TextStyle(
                                  fontSize: height / 44.89,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: width / 56.75),
                            // Chips to display product categories
                            Wrap(
                              spacing: width / 56.75,
                              children: product.categories!
                                  .map((category) => Chip(
                                        label: Text(category.name ?? ''),
                                        backgroundColor: AppColor.bgColor,
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      SizedBox(height: height / 101),

                      // Availability
                      Row(
                        children: [
                          Text(
                            'Availability: ',
                            style: TextStyle(
                                fontSize: height / 50.5,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          // Availability status
                          Text(
                            product.stockStatus == 'instock'
                                ? 'In Stock (${product.stockQuantity ?? 'N/A'})'
                                : 'Out of Stock',
                            style: TextStyle(
                              color: product.stockStatus == 'instock'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height / 50.5),

                      // Available Variations (DropDown or Chip selector)
                      if (productVariations.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Available Variations:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Wrap(
                              spacing: 8.0,
                              children: productVariations.map((variation) {
                                return ChoiceChip(
                                  label: Text(
                                      variation.attributes?.first.option ??
                                          'N/A'),
                                  selected: selectedVariation == variation,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      selectedVariation =
                                          selected ? variation : null;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      SizedBox(height: height / 28.86),
                      // Product Description
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: height / 40.4,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      SizedBox(height: height / 101),
                      Card(
                        elevation: 1,
                        color: AppColor.bgColor,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            cleanDescription(product.description!),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: height / 50.5, color: Colors.black54),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 33.67),
                      // Reviews Section
                      Text(
                        'Customer Reviews & Ratings',
                        style: TextStyle(
                            fontSize: height / 40.4,
                            fontWeight: FontWeight.bold,
                            color: AppColor.typographyColor),
                      ),
                      const SizedBox(height: 8.0),

                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : reviews.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: reviews.length,
                                  itemBuilder: (context, index) {
                                    final review = reviews[index];
                                    return Card(
                                      color: AppColor.bgColor,
                                      elevation: 1,
                                      margin: EdgeInsets.symmetric(
                                          vertical: height / 101),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(review
                                                  .reviewerAvatarUrls?.size48 ??
                                              'https://via.placeholder.com/48'),
                                        ),
                                        title: Text(
                                          review.reviewer ?? 'Anonymous',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: height / 202),
                                            Text(cleanDescription(
                                                review.review!)),
                                            SizedBox(height: height / 202),
                                            Row(
                                              children: List.generate(
                                                review.rating ?? 0,
                                                (index) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: height / 40.4,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Text(
                                  'No reviews available for this product.',
                                  style: TextStyle(
                                      fontSize: height / 50.5,
                                      color: Colors.grey),
                                ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Add to Cart and Buy Now Buttons
          Container(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width / 2.25,
                        child: Consumer<CartProvider>(
                          builder: (BuildContext context, CartProvider provider, Widget? child)
                          {
                            return ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                elevation: 4,
                                backgroundColor: AppColor.bgColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                    color: AppColor.primaryColor, // Border color
                                    width: 1, // Border width
                                  ),
                                ),
                              ),
                              label: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: height / 55),
                              ),
                              onPressed: () {

                                bool isAdd = provider.cartItems.any((product)=> product.id == widget.id);
                                if (!isAdd) {
                                  provider.addToCart(product,context);
                                  return;
                                }else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Product already in cart!')));
                                }

                              },
                            );
                          },

                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width / 45.4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 2.25,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: Text(
                            'Buy Now',
                            style: TextStyle(
                                color: AppColor.bgColor, fontSize: height / 55),
                          ),
                          onPressed: () {
                            // Handle cart action
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
