import 'package:flutter/material.dart';
import 'package:shopapp/screens/ProductOverviewScreen.dart';
import 'package:shopapp/screens/orders_screen.dart';
import 'package:shopapp/screens/products_manage_screen.dart';

class app_drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            AppBar(automaticallyImplyLeading: false,),
           ListTile(
              title: Text("Shop"),
              leading: Icon(Icons.shop),
              onTap: (){Navigator.of(context).pushReplacementNamed("/");},
            ),
            Divider(thickness: 1.2,),
             ListTile(
              title: Text("Orders"),
              leading: Icon(Icons.payment),
              onTap: (){Navigator.of(context).pushReplacementNamed(orders_screen.RouteName);},
            ),
            Divider(thickness: 1.2,),
            ListTile(
              title: Text("Manage Products"),
              leading: Icon(Icons.edit),
              onTap: (){Navigator.of(context).pushReplacementNamed(products_manage_screen.ROUTENAME);},
            )

          ],
        ),
      );

  }
}
