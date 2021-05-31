import 'package:flutter/material.dart';
import 'package:pizza_restaurant/blocs/bloc.dart';

class Provider extends InheritedWidget{
  final bloc = Bloc();

  Provider({required Key key, required Widget child}): super(key: key, child:  child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc);
  }

}