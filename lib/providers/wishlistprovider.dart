import 'package:flutter/material.dart';

class WishProvider with ChangeNotifier {
  final List<int> _wishListed = [];
  List<int> get wishListed => _wishListed;
  bool _isliked = false;
  bool get isliked => _isliked;

  void addWish(int id) {
    _wishListed.add(id);
    _isliked = true;
    notifyListeners();
  }

  void removeWish(int id) {
    _wishListed.remove(id);
    _isliked = false;
    notifyListeners();
  }
}
