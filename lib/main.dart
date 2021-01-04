import 'package:flutter/material.dart';
import 'package:fruitshop/homeScreen.dart';

void main() {
  runApp(FruitShop());
}

class FruitShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
