import 'package:flutter/material.dart';
import '../widgets/ProductsGrid.dart';
import 'package:shopapp/widgets/ProductsItem.dart';
import '../models/Products.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const String RouteName="/ProductOverviewScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
      ),
      body: ProductsGrid(),

    );
  }
}

