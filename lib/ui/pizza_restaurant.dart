import 'package:flutter/material.dart';
import 'package:pizza_restaurant/blocs/bloc.dart';
import 'package:pizza_restaurant/blocs/provider.dart';

class pizza_restaurant extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _bloc = provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Alex's Pizza")
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            firstMenu(_bloc),
            secondMenu(_bloc),
            orderInformation(_bloc)
          ],
        ),
      ),
    );
  }

  firstMenu(Bloc bloc) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text("Napolitana"),
              onPressed: null,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: ElevatedButton(
              child: Text("California Style"),
              onPressed: null,
            ),
          )
        ],
      ),
    );
  }

  secondMenu(Bloc bloc) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text("Sushi"),
              onPressed: null,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: ElevatedButton(
              child: Text("Marinada"),
              onPressed: null,
            ),
          )
        ],
      ),
    );
  }

  orderInformation(Bloc bloc) {
    return Container();
  }
}