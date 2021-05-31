import 'package:flutter/material.dart';
import 'package:pizza_restaurant/blocs/provider.dart';
import 'package:pizza_restaurant/ui/pizza_restaurant.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return provider(
      child: MaterialApp(
        home: new pizza_restaurant(),
      ),
    );
  }
}