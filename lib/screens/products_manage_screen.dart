import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/ProductsProvider.dart';
import 'package:shopapp/screens/add_product_screen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/products_manage_singlerow.dart';

class products_manage_screen extends StatelessWidget {
  static String ROUTENAME = "/products_manage_screen";

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductsProvider>(context);

    return Scaffold(
      drawer: app_drawer(),
      appBar: AppBar(
        title: Text("Manage Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(add_product_screen.Route_Name);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) =>
            products_manage_singlerow(product.items.elementAt(i)),
        itemCount: product.items.length,
      ),
    );
  }
}
