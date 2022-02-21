import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';

class cart_single_row extends StatelessWidget {
  String title;

  String imgurl;

  String id;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Are You Sure?"),
                content: const Text("Do you want to remove item from the cart?"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("Yes")),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("No"))
                ],
              )),
      background: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).errorColor,
          ),
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 13.5),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 35,
          )),
      onDismissed: (direction) {
        cart.dismissItem(id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          child: ListTile(
            title: Text(title),
            subtitle: Consumer<Cart>(
                builder: (ctx, value, child) => Text(
                    ((value.items[id]!.price) * value.items[id]!.quantity)
                        .toString())),
            leading: CircleAvatar(
              radius: 25,
           backgroundImage: NetworkImage(
                imgurl,

              ),
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
                        icon: const Icon(Icons.plus_one)),
                    Text(value.items[id]!.quantity.toString()),
                    IconButton(
                        onPressed: () {
                          value.decreaseQuantity(id);
                        },
                        icon: const Icon(Icons.exposure_minus_1))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  cart_single_row(this.title, this.imgurl, this.id);
}
