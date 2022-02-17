import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screens/cart_screen.dart';
import '/providers/ProductsProvider.dart';
import '../screens/ProductDetailScreen.dart';
import '../screens/ProductOverviewScreen.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (BuildContext context) {
        return ProductsProvider();
      }),
  ChangeNotifierProvider(create: (BuildContext context) {
    return Cart();
  })
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
        routes: {ProductDetailScreen.RouteName: (_) => ProductDetailScreen()
        ,cart_screen.Route_name:(_)=>cart_screen()});
  }
}
