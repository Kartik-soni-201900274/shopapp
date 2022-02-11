import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ProductsProvider.dart';
import './ProductsItem.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final productsdata=Provider.of<ProductsProvider>(context);
final loadedProducts=productsdata.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) => ProductsItem(
            loadedProducts[index].imageUrl,
            loadedProducts[index].title,
            loadedProducts[index].id));
  }
}
