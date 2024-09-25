import 'package:flutter/material.dart';
import 'package:grocery_cart_app/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductTile({super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(product.name),
        subtitle: Text('₹${product.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: onAddToCart,  // Call the add to cart callback
        ),
      ),
    );
  }
}
