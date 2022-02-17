import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Products.dart';
import 'package:shopapp/providers/ProductsProvider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screens/ProductDetailScreen.dart';

class ProductsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context,listen: false);
    final cart = Provider.of<Cart>(context,listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(ProductDetailScreen.RouteName, arguments: product.id),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Products>(
            builder: (ctx,product,child)=> IconButton(
              icon: Icon(product.isFavorite?Icons.favorite:Icons.favorite_border_outlined,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          trailing: Consumer<Cart>(
            builder: (ctx,cart,child)=>  IconButton(
              icon: Icon(cart.containsitem(product.id)?
                Icons.shopping_cart:Icons.shopping_cart_outlined,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {cart.addItem(product.id, product.price, product.title,product.imageUrl);},
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
