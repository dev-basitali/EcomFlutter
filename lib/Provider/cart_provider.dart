
import '../../Export/export_dev.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
   double _subTotal = 0;
   double get subTotal => _subTotal;
  final List<ProductsDetail> _cartItems = [];
  List<int> itemsQuantity = [];

  List<ProductsDetail> get cartItems => _cartItems;


  int _counter = 1;
  int get counter => _counter ;

  void addToCart(ProductsDetail product , BuildContext context) {
    if(product.stockQuantity == null || product.stockQuantity! <=0) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "This Product is Out of Stock",
      );
    } else  {
      _cartItems.add(product);
      itemsQuantity.add(1);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added to cart!')));
      _calculateSubTotal();
    }

    notifyListeners();
  }

  void removeFromCart(ProductsDetail product) {
    _cartItems.remove(product);
    _calculateSubTotal();
    notifyListeners();
  }
  void addCounter (ProductsDetail product, int index) {
    if(product.stockQuantity==null) {
      itemsQuantity[index] = 0;
    } else if (product.stockQuantity! > itemsQuantity[index]) {
      itemsQuantity[index]++;
    }
   _calculateSubTotal();
   notifyListeners();
  }
  void removeCounter (int index) {
    if (itemsQuantity[index] > 1) {
      itemsQuantity[index]--;
    }
    _calculateSubTotal();
    notifyListeners();
  }

   void _calculateSubTotal() {
     _subTotal = 0; // Reset subtotal
     for (int i = 0; i < _cartItems.length; i++) {
       final double unitPrice = double.tryParse(_cartItems[i].price ?? '0') ?? 0;
       _subTotal += unitPrice * itemsQuantity[i];
     }
   }
   void clearCart() {
     _cartItems.clear();
     itemsQuantity.clear();
     _calculateSubTotal(); // Reset subtotal
     notifyListeners();
   }


   int get cartItemCount => _cartItems.length;
}
