import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Cart", style: TextStyle(fontSize: 30)),
      ),
      body: const Center(
        child: Text("Cart Screen", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
