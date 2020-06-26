import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/provider/modal.dart';

import '../route.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartNotifier>(context);

    return cart.cartList.isNotEmpty
        ? Badge(
            position: BadgePosition.topRight(top: 0, right: 3),
            badgeColor: Theme.of(context).iconTheme.color,
            shape: BadgeShape.circle,
            borderRadius: 20,
            animationDuration: Duration(milliseconds: 300),
            toAnimate: true,
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              '${cart.totalQty}',
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            child: _cartBag(context),
          )
        : _cartBag(context);
  }

  IconButton _cartBag(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Theme.of(context).buttonColor,
      ),
      onPressed: () => Navigator.of(context).pushNamed(RouteName.cart),
    );
  }
}
