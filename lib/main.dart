import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/screens/add_product_screen.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/orders_screen.dart';
import 'package:shopapp/screens/products_manage_screen.dart';
import '/providers/ProductsProvider.dart';
import '../screens/ProductDetailScreen.dart';
import '../screens/ProductOverviewScreen.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (BuildContext context) {
        return ProductsProvider();
      }),
  ChangeNotifierProvider(create: (BuildContext context) {
    return Cart();
  }),
  ChangeNotifierProvider(create: (BuildContext context) {
    return Orders();
  }),
    ], child: MyHomePage()));


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {ProductDetailScreen.RouteName: (_) => ProductDetailScreen(),
        cart_screen.Route_name:(_)=>cart_screen(),
    add_product_screen.Route_Name:(_)=>add_product_screen(),
        orders_screen.RouteName:(_)=>orders_screen(),
          add_product_screen.Route_Name:(_)=>add_product_screen(),
       products_manage_screen.ROUTENAME:(_)=>products_manage_screen() });
  }
}
