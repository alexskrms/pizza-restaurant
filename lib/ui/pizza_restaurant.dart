import 'package:flutter/material.dart';
import 'package:pizza_restaurant/blocs/bloc.dart';
import 'package:pizza_restaurant/blocs/provider.dart';

class pizza_restaurant extends StatelessWidget {
  var pizzaName = "";
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
              onPressed: () {
                bloc.newOrder("Napolitana");
                pizzaName = "Napolitana";
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: ElevatedButton(
              child: Text("California"),
              onPressed: () {
                bloc.newOrder("California");
                pizzaName = "California";
              },
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
              onPressed: () {
                bloc.newOrder("Sushi");
                pizzaName = "Sushi";
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: ElevatedButton(
              child: Text("Marinada"),
              onPressed: () {
                bloc.newOrder("Marinada");
                pizzaName = "Marinada";
              },
            ),
          )
        ],
      ),
    );
  }

  orderInformation(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.showOrders,
      builder: (context, AsyncSnapshot<String> snapshot){
        if(snapshot.hasData){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                snapshot.data.toString(),
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
              ),
              Text("Ready! Take your pizza $pizzaName!")
            ],
          );
        }else if(snapshot.hasError){
          return Column(
            children: <Widget>[
              Image.network("http://megatron.co.il/en/wp-content/uploads/sites/2/2017/11/out-of-stock.jpg",
              fit: BoxFit.fill,
              ),
              Text(
                snapshot.error.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0
                ),
              ),
            ],
          );
        }else{
          return Text("No pizza selected!");
        }
      },
    );
  }
}