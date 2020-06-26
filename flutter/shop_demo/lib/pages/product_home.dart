import 'package:flutter/material.dart';
import '../widgets/cart_badge_widget.dart';
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
          CartBadge(),
          //FIXME when 0 count disable fav menu
          filter(theme),
        ],
      ),
      body: SafeArea(
        child: ProductGridView(showOnlyFavorite: _showOnlyFavorite),
      ),
    );
  }

  PopupMenuButton<FilterOption> filter(ThemeData theme) {
    return PopupMenuButton(
      //  enabled: haveFavorite,
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
