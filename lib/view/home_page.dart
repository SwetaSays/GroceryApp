import 'package:flutter/material.dart';
import 'package:grocery_cart_app/models/product.dart';
import 'package:grocery_cart_app/providers/cart_provider.dart';
import 'package:grocery_cart_app/widgets/product_tiles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Product> products = [
    Product(name: 'Apple', price: 100.0, image: 'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg'),
    Product(name: 'Banana', price: 50.0, image: 'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg'),
    Product(name: 'Orange', price: 70.0, image: 'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductTile(
            product: products[index],
            onAddToCart: () {
              Provider.of<CartProvider>(context, listen: false).addProduct(products[index]);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${products[index].name} added to cart.  Total items: ${Provider.of<CartProvider>(context, listen: false).totalItems()}'),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.black87,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

