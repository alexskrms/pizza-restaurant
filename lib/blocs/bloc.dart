import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Bloc {
  final orders = StreamController<String>();
  Stream<String> get showOrders => orders.stream.transform(validateOrder);
  static final _pizzasList = {
    "Sushi": 2,
    "Napolitana": 3,
    "California": 4,
    "Marinada": 1
  };

  static final _pizzasImages = {
    "Sushi": "http://pngimg.com/uploads/pizza/pizza_PNG44077.png",
    "Napolitana": "http://pngimg.com/uploads/pizza/pizza_PNG44078",
    "California": "http://pngimg.com/uploads/pizza/pizza_PNG44081",
    "Marinada": "http://pngimg.com/uploads/pizza/pizza_PNG44084"
  };

  final validateOrder = StreamTransformer<String, String>.fromHandlers(handleData: (order, sink) {
    if(_pizzasList[order] != null){
      if(_pizzasList[order]! > 0){
        sink.add(_pizzasImages[order].toString());
        final quantity = _pizzasList[order];
        _pizzasList[order] = (quantity! - 1);
      }else{
        sink.addError("Pizza not available");
      }
    }else{
      sink.addError("Pizza not found");
    }
  });

  void newOrder(String pizza){
    orders.sink.add(pizza);
  }
}