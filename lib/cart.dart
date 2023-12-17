import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _currentIndex = 1;

  int get currentIndex => _currentIndex;

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}