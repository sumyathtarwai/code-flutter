import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import '../provider/modal.dart';
import '../widgets/product_grid_view.dart';

enum FilterOption { favorite, all }

class ProductHome extends StatefulWidget {
  const ProductHome({Key key}) : super(key: key);

  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var products = Provider.of<ProductNotifer>(context);
    var cart = Provider.of<CartNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KAIMONO',
          style: theme.textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: theme.iconTheme,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () => {}),
        actions: <Widget>[
          cart.cartList.isNotEmpty
              ? Badge(
                  position: BadgePosition.topRight(top: 0, right: 3),
                  badgeColor: theme.iconTheme.color,
                  shape: BadgeShape.circle,
                  borderRadius: 20,
                  animationDuration: Duration(milliseconds: 300),
                  toAnimate: true,
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    '${cart.totalQty}',
                    style: TextStyle(
                      color: theme.primaryColorLight,
                    ),
                  ),
                  child: cartBag(theme),
                )
              : cartBag(theme),
          //FIXME when 0 count disable fav menu
          filter(theme, products.favoriteCount > 0),
        ],
      ),
      body: SafeArea(
        child: ProductGridView(showOnlyFavorite: _showOnlyFavorite),
      ),
    );
  }

  IconButton cartBag(ThemeData theme) {
    return IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: theme.buttonColor,
        ),
        onPressed: () => {});
  }

  PopupMenuButton<FilterOption> filter(ThemeData theme, bool haveFavorite) {
    return PopupMenuButton(
      onSelected: (val) {
        if (val == FilterOption.favorite) {
          setState(() => _showOnlyFavorite = true);
        } else {
          setState(() => _showOnlyFavorite = false);
        }
      },
      icon: Icon(
        Icons.filter_list,
        color: theme.buttonColor,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: FilterOption.all,
          child: Text('Show All'),
        ),
        PopupMenuItem(
          value: FilterOption.favorite,
          //FIXME haveFavorite
          enabled: true,
          child: Text('Only Favorites'),
        ),
      ],
    );
  }
}
