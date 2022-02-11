import 'package:flutter/material.dart';
import 'package:shopapp/screens/ProductDetailScreen.dart';

class ProductsItem extends StatelessWidget {
  final String imgageSrc;
  final String title;
  final String id;

  ProductsItem(this.imgageSrc, this.title, this.id);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: ()=>Navigator.of(context).pushNamed(ProductDetailScreen.RouteName,arguments: id),
          child: Image.network(
            imgageSrc,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(icon:Icon(Icons.favorite_border_outlined,color: Theme.of(context).accentColor) , onPressed: () {  },),
          trailing: IconButton(icon:Icon(Icons.shopping_cart_outlined,color: Theme.of(context).accentColor,) , onPressed: () {  },),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
