import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Products.dart';
import 'package:shopapp/providers/ProductsProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String RouteName = "/ProductDetailScreen";
  late final String id;
  @override
  Widget build(BuildContext context) {
    // id=ModalRoute.of(context)?.settings.arguments as String;
    // final productsData=Provider.of<ProductsProvider>(context,listen: false) ;
    // final title=productsData.FindById(id).title;
    return Scaffold(appBar: AppBar(title:Text("itle"),),);
  }
}
