import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imgurl;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  required this.imgurl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items==null?0:_items.length;
  }

void increaseQuantity(String id)

{
  _items.update(
    id,
        (existingCartItem) => CartItem(
      id: existingCartItem.id,
      title: existingCartItem.title,
      price: existingCartItem.price,
      imgurl: existingCartItem.imgurl,
      quantity: existingCartItem.quantity + 1,
    ),
  );
  notifyListeners();
}
  void decreaseQuantity(String id)
  {

    _items.update(
      id,
          (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        imgurl: existingCartItem.imgurl,
        quantity: existingCartItem.quantity==1?existingCartItem.quantity:existingCartItem.quantity-1,
      ),
    );
    notifyListeners();
  }

  double get total{
    double totalprice=0;
    _items.forEach((key, value) {totalprice+=(value.price*value.quantity); });
    return totalprice;
  }
void dismissItem(String id)
{
  _items.remove(id);
  notifyListeners();
}

  bool containsitem( String productid)
  {
    if(_items.containsKey(productid))
      {
        return true;
      }
    else
      {
        return false;
      }
  }
  void addItem(
      String productId,
      double price,
      String title,
      String img,
      ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          imgurl: existingCartItem.imgurl,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
              imgurl: img
        ),
      );
    }
    notifyListeners();
  }
  void clear() {
    _items = {};
    notifyListeners();
  }


  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if ((_items[productId]?.quantity)!> 1) {
      _items.update(
          productId,
              (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity - 1, imgurl: existingCartItem.imgurl,
          ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}


