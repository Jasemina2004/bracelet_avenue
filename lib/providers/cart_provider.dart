import 'package:flutter/material.dart';
import 'package:bracelet_avenue/models/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> cartItems = [];
  List<Product> wishlistItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    notifyListeners();
  }

  void toggleFavorite(String productId) {
    final index = wishlistItems.indexWhere((item) => item.id == productId);
    if (index >= 0) {
      wishlistItems.removeAt(index);
    } else {
      final product = cartItems.firstWhere((item) => item.id == productId);
      wishlistItems.add(product);
    }
    notifyListeners();
  }
}
