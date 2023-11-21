import 'package:flutter/material.dart';

class Cartprovider with ChangeNotifier {
  final List<int> _cartAdd = [];
  List<int> get cartAdded => _cartAdd;
  bool _ontapped = false;
  bool get ontapped => _ontapped;

  void addCart(int id) {
    _cartAdd.add(id);
    _ontapped = true;
    notifyListeners();
  }

  void removeCart(int id) {
    _cartAdd.remove(id);
    _ontapped = false;
    notifyListeners();
  }
}
