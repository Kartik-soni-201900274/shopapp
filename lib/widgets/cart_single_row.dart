import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';

class cart_single_row extends StatelessWidget {
  String title;
  double price;
  String imgurl;
  int quantity;
  String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          child: ListTile(
            title: Text(title),
            subtitle: Text((price * quantity).toString()),
            leading: Image.network(
              imgurl,
              height: 100,
              width: 50,
            ),
            trailing: Container(
              width: 120,
              child: Consumer<Cart>(
                builder: (ctx, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          value.increaseQuantity(id);
                        },
                        icon: Icon(Icons.plus_one)),
                    Text(quantity.toString()),
                    IconButton(
                        onPressed: () {
                          value.decreaseQuantity(id);
                        },
                        icon: Icon(Icons.exposure_minus_1))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  cart_single_row(this.title, this.price, this.imgurl, this.quantity, this.id);
}
