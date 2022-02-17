import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/widgets/cart_single_row.dart';

class cart_screen extends StatelessWidget {
  static const String Route_name = "/cart_screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    Map<String, CartItem> cartItems = cart.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.total.roundToDouble()}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text("ORDER NOW",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            margin: EdgeInsets.all(15),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => cart_single_row(
                cart.items.values.elementAt(i).title,
                cart.items.values.elementAt(i).price,
                cart.items.values.elementAt(i).imgurl,
                cart.items.values.elementAt(i).quantity,
                cart.items.values.elementAt(i).id.toString()),
            itemCount: cartItems.length,
          )),
        ],
      ),
    );
  }
}
