import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/provider/modal.dart';
import '../widgets/common/common_part_export.dart';
import '../widgets/product/product_part_export.dart';

enum FilterOption { favorite, all }

class ProductHome extends StatefulWidget {
  final bool showOnlyFavorite;
  const ProductHome({Key key, this.showOnlyFavorite = false}) : super(key: key);

  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  var _showOnlyFavorite = false;

  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      _showOnlyFavorite = widget.showOnlyFavorite;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<List<ProductItem>> _refreshData() async {
    final of = Provider.of<ProductList>(context, listen: false);
    return await of.fetchProducts();
  }

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
        actions: <Widget>[
          CartBadge(),
          //FIXME when 0 count disable fav menu
          filter(theme),
        ],
      ),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: RefreshIndicator(
            onRefresh: _refreshData,
            backgroundColor: Theme.of(context).primaryColorDark,
            child: ProductGridView(showOnlyFavorite: _showOnlyFavorite)),
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
