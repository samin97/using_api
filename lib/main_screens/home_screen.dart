import 'package:flutter/material.dart';

import '../authenticate/login.dart';
import 'cart/cart.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: "Lobster",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ElevatedButton(
          onPressed: () {
            Route newRoute =
            MaterialPageRoute(builder: (_) => const Login());
            Navigator.pushReplacement(context, newRoute);
          },
          child: Text("homepage")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Route newRoute =
          MaterialPageRoute(builder: (_) => CartScreen());
          Navigator.pushReplacement(context, newRoute);
        },
        tooltip: 'View cart',
        label: const Text('Cart'),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue,

      ),

    );
  }
}
