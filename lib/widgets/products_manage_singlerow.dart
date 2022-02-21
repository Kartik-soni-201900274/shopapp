import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Products.dart';
import 'package:shopapp/providers/ProductsProvider.dart';
import 'package:shopapp/screens/add_product_screen.dart';

class products_manage_singlerow extends StatelessWidget {
  Products product;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    return
       Card(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
        elevation: 8,
        child: Container(

          padding: const  EdgeInsets.symmetric(vertical: 8,horizontal: 13),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(product.imageUrl),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0,),
                child: Text(product.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Spacer(),
              IconButton(onPressed: (){Navigator.of(context).pushNamed(add_product_screen.Route_Name,arguments: product.id);}, icon: const Icon(Icons.edit,color: Colors.purple,)),
              IconButton(onPressed: (){products.deleteproduct(product.id);}, icon: const Icon(Icons.delete,color: Colors.red,)),

            ],
          ),
        ),
      );
  }

  products_manage_singlerow(this.product);
}
