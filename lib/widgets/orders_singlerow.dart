import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/orders.dart';

class orders_singlrow extends StatefulWidget {
  final String id;

  @override
  State<orders_singlrow> createState() => _orders_singlrowState();

  orders_singlrow(this.id);
}

class _orders_singlrowState extends State<orders_singlrow> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final order = Provider.of<Orders>(context, listen: false);
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text("\$" +
                  order.orders
                      .firstWhere((e) => e.id == widget.id)
                      .amount
                      .toStringAsFixed(2)),
              subtitle: Text(DateFormat("MMMM d").format(order.orders
                      .firstWhere((e) => e.id == widget.id)
                      .dateTime) +
                  ", " +
                  DateFormat("hh:mm a").format(order.orders
                      .firstWhere((e) => e.id == widget.id)
                      .dateTime)),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              ),
            ),
            if (_expanded)
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.black54,
                  ),
                  height: min(  order.orders
                      .firstWhere((e) => e.id == widget.id).products.length* 20 + 15, 380),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: ListView(
                    children: order.orders
                        .firstWhere((e) => e.id == widget.id)
                        .products
                        .map(
                          (prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                prod.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${prod.quantity}x \$${prod.price}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ))
          ],
        ));
  }
}
