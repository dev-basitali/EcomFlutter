
import 'package:flutter/cupertino.dart';
import 'package:store_app/Model/product_service.dart';

class FavouriteItems extends ChangeNotifier{
  List<ProductsDetail> _selectedItems = [];
  List<ProductsDetail> get selectedItems => _selectedItems;

  List<Category> _allCatList = [];
  List<Category> get allCatList => _allCatList;

  int _id = 0;

  int get id => _id;

  set id  (int value) {
    _id = value;
    notifyListeners();
  }
set allCatList (List<Category> list){
  _allCatList = list;
  notifyListeners();
}


  void addItem(ProductsDetail product) {
    if (!_selectedItems.any((item) => item.id == product.id)) {
      _selectedItems.add(product);
    }
    notifyListeners();
  }

  void removeItem(ProductsDetail product) {
    _selectedItems.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  bool isFavourite(ProductsDetail product) {
    return _selectedItems.any((item) => item.id == product.id);
  }
}