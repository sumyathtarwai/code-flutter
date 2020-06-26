import 'package:flutter/foundation.dart';

import 'modal.dart';

class ProductList with ChangeNotifier {
  //int id;
  final List<ProductItem> _products = [...dummyProduct];

  List<ProductItem> get products {
    return [..._products];
  }

  ProductItem whereId(String id) {
    return _products.firstWhere((el) => id == el.id);
  }

  int get favoriteCount {
    return _products.where((el) => el.isFavorite).length;
  }

  List<ProductItem> get favoritesProducts {
    return _products.where((el) => el.isFavorite).toList();
  }
}
