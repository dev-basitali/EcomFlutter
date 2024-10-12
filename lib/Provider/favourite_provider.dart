import 'package:flutter/foundation.dart';

class FavouriteItems extends ChangeNotifier{
  List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems;

  void addItem(int value) {
    selectedItems.add(value);
    notifyListeners();
  }
  void removeItem(int value) {
    selectedItems.remove(value);
    notifyListeners();
  }
}