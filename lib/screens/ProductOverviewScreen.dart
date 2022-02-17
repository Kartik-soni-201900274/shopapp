import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/ProductsProvider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screens/cart_screen.dart';
import '../widgets/ProductsGrid.dart';
import 'package:shopapp/widgets/ProductsItem.dart';
import '../providers/Products.dart';
import '../widgets/badge.dart';

enum selectgrid {
  onlyFav,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  static const String RouteName = "/ProductOverviewScreen";

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showonlyfav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: [
          Consumer<Cart>(
            builder: (BuildContext context, Cartdata, child) => Badge(
              color: Colors.red,
              value: Cartdata.itemCount.toString(),
              child: child!,
            ),
            child:
                IconButton(onPressed: ()=>Navigator.pushNamed(context, cart_screen.Route_name), icon: Icon(Icons.shopping_cart)),
          ),
          PopupMenuButton(
              onSelected: (selectgrid value) {
                setState(() {
                  if (value == selectgrid.onlyFav) {
                    showonlyfav = true;
                  } else {
                    showonlyfav = false;
                  }
                });
              },
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text("Show Only Fav"),
                      value: selectgrid.onlyFav,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: selectgrid.all,
                    )
                  ])
        ],
      ),
      body: ProductsGrid(showonlyfav),
    );
  }
}
