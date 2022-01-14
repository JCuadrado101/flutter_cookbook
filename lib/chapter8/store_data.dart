import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter8/httphelper.dart';

import 'lib/pizza.dart';

class StoreData extends StatefulWidget {
  const StoreData({Key? key}) : super(key: key);

  @override
  State<StoreData> createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {
  String pizzaString = 'pizza';

  Future<List<Pizza>> readJsonFile() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizza.json');
    List myMap = jsonDecode(jsonString);

    List<Pizza> myPizzas = [];
    myMap.forEach((dynamic pizza) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    });
    return myPizzas;
  }

  Future<List<Pizza>> callPizzas() async {
    HttpHelper httpHelper = HttpHelper();
    List<Pizza> pizzas = await httpHelper.getPizzas();
    return pizzas;
}


  @override
  initState() {
    super.initState();
    callPizzas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store Data')),
      body: FutureBuilder<List<Pizza>>(
        future: callPizzas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].pizzaName),
                  subtitle: Text(snapshot.data![index].description),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
