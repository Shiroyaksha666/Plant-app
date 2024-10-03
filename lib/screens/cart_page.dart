import 'package:flutter/material.dart';
import 'package:plant_app/Models/plant.dart';

class CartPage extends StatefulWidget {
  final List<Plant> myCart;
  const CartPage({
    super.key,
    required this.myCart,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('cartpage'),
      ),
    );
  }
}
