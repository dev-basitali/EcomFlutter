import 'package:flutter/material.dart';

import 'package:store_app/Export/export_dev.dart';

class CheckOutProvider extends ChangeNotifier {
  List<ShippingAddress> _getShippingAddress = [];
  String? _selectedstate;
  String? _selectedPaymentMethod;
  Function(String message)? showSnackBar;

  List<ShippingAddress> get getShippingAddress => _getShippingAddress;

  void addShippingAddress(ShippingAddress address) {
    _getShippingAddress.add(address);
    showSnackBar?.call("Address added successfully!");
    notifyListeners();
  }

  String? get selectedstate => _selectedstate;

  void setSelectedState(String? value) {
    _selectedstate = value;
    notifyListeners();
  }

  String? get selectedPaymentMethod => _selectedPaymentMethod;

  set selectedPaymentMethod(String? value) {
    _selectedPaymentMethod = value;
    notifyListeners();
  }

  set getShippingAddress(List<ShippingAddress> value) {
    _getShippingAddress = value;
    notifyListeners();
  }
}
