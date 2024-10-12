  import 'dart:convert';

  import 'package:dio/dio.dart';
  import 'package:flutter/material.dart';
  import 'package:store_app/Common/Utils/app_colors.dart';
  import 'package:store_app/Model/lists_class.dart';
  import 'package:http/http.dart' as http;

  import '../../Model/product_service.dart';
  import 'new_card.dart';


   // Import the Product model
  class ProductPage extends StatefulWidget {
    const ProductPage({super.key});

    @override
    State<ProductPage> createState() => _ProductPageState();
  }

  class _ProductPageState extends State<ProductPage> {

    final dio = Dio();
     List<ProductsDetail> products = [];
    Future<List<ProductsDetail>> getProducts() async {
      const String baseUrl = 'https://192.168.100.5/ecomFlutter/wp-json/wc/v3/products';
      const String consumerKey = 'ck_d3c2d1f8f9fad21b9418d65340693709d7a20390';
      const String consumerSecret = 'cs_8f4821b3ca6431aea2620ad610249bb2d21a32ba';

      try {
        final response = await http.get(
          Uri.parse('$baseUrl?consumer_key=$consumerKey&consumer_secret=$consumerSecret'),
            headers: {
            'CCApp' : 'true'
            }
        );
        print("Response Status Code: ${response.statusCode}");
        var data = jsonDecode(response.body) as List;
        print("Data: $data");

        if (response.statusCode == 200) {
          products = data.map((product) => ProductsDetail.fromJson(product)).toList();
          return products;
        } else {
          print("Error: Failed to fetch products. Status Code: ${response.statusCode}");
          print("Error Message: ${response.body}");
          return products;
        }
      } catch (e) {
        print("Exception occurred: $e");
        return products;
      }
    }
    @override
    void initState() {

      getProducts;
      // TODO: implement initState
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: FutureBuilder(
            future: getProducts(),
            builder: (context , snapshot){
              if(!snapshot.hasData) {
               return Center(child: CircularProgressIndicator());
              }else{
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      double discountPercentage = calculateDiscountPercentage(products[index].regularPrice.toString(), products[index].salePrice,);
                      return CustomProductCard(
                        id: products[index].id,
                        productName: products[index].name,
                        oldPrice: products[index].regularPrice,
                        newPrice: products[index].salePrice,
                        discountPercentage: double.parse(discountPercentage.toStringAsFixed(1)),
                        ratingCount: products[index].averageRating,
                        imagePath: products[index].images!.isNotEmpty
                            ? products[index].images![0].src.replaceAll('localhost', '192.168.18.52')  // Replace 'localhost' with your IP address
                            : 'https://example.com/default_image.png',
                      );
                    },
                  ),
                );
              }
            }
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

