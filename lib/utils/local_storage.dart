import 'package:grocery_cart_app/models/product.dart';
import 'package:hive/hive.dart';

class LocalStorageService {
  static const String cartBoxName = 'cartBox';

  static Future<void> saveCartItems(List<Product> products) async {
    var box = await Hive.openBox(cartBoxName);
    await box.clear(); // Clear existing items
    for (var product in products) {
      box.put(product.name, product.toMap());
    }
  }

  static Future<List<Product>> getCartItems() async {
    var box = await Hive.openBox(cartBoxName);
    return box.values.map((e) => Product.fromMap(Map<String, dynamic>.from(e))).toList();
  }
}
