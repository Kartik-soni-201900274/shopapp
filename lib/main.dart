import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/ProductDetailScreen.dart';
import '../screens/ProductOverviewScreen.dart';
import '../providers/Productsprovider.dart';
void main() => runApp(MyHomePage());


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsProvider(),
      child: MaterialApp(
              title: 'MyShop',
              theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
          ),
          home: ProductOverviewScreen(),
          routes: {
              ProductDetailScreen.RouteName:(_)=>ProductDetailScreen()}

  )
    );
  }
}
