import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/orders_singlerow.dart';

class orders_screen extends StatelessWidget {
  static const RouteName = "/orders_screen";

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Orders"),
        ),
        drawer: app_drawer(),
        body: Container(
          child: ListView.builder(
            itemBuilder: (ctx, i) => orders_singlrow(orders.orders[i].id),
            itemCount: orders.orders.length,
          ),
        ));
  }
}
