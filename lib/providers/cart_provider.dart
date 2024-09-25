import 'package:flutter/material.dart';
import 'package:grocery_cart_app/models/product.dart';
import 'package:grocery_cart_app/utils/local_storage.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addProduct(Product product) {
    var existingProduct = _cartItems.firstWhere(
          (item) => item.name == product.name,
      orElse: () => Product(name: '', price: 0, image: ''),
    );

    if (existingProduct.name.isEmpty) {
      _cartItems.add(product);
    } else {
      existingProduct.quantity += 1;
    }

    LocalStorageService.saveCartItems(_cartItems);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cartItems.remove(product);
    LocalStorageService.saveCartItems(_cartItems);
    notifyListeners();
  }

  int totalItems() {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  double totalPrice() {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void loadCartItems() async {
    _cartItems = await LocalStorageService.getCartItems();
    notifyListeners();
  }
}
