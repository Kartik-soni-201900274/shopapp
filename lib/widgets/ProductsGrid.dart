import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/ProductsProvider.dart';
import 'package:shopapp/providers/Products.dart';
import 'ProductsItem.dart';


class ProductsGrid extends StatelessWidget {
  bool showonlyfav;
  ProductsGrid(this.showonlyfav);

  @override
  Widget build(BuildContext context) {


final productsdata=Provider.of<ProductsProvider>(context);

final loadedProducts=showonlyfav?productsdata.Favitems :productsdata.items;


    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) {return  ChangeNotifierProvider.value(

          value: loadedProducts[i],
          child: ProductsItem(),
        );});
  }
}
