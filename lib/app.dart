import 'package:flutter/material.dart';
import 'package:pizza_restaurant/blocs/provider.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(key: key, child: child);
  }
}