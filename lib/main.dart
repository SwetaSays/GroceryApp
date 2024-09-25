import 'package:flutter/material.dart';
import 'package:grocery_cart_app/view/cart_page.dart';
import 'package:grocery_cart_app/view/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider()..loadCartItems(),
      child: MaterialApp(
        title: 'Grocery Cart',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage(),
        routes: {
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}

