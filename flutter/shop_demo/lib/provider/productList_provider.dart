import 'package:flutter/foundation.dart';

import '../provider/modal.dart';

class ProductNotifer with ChangeNotifier {
  List<Product> _products = [...dummyProduct];

  List<Product> get products {
    return [..._products];
  }

  Product whereId(String id) {
    return _products.firstWhere((el) => id == el.id);
  }

  int get favoriteCount {
    return _products.where((el) => el.isFavorite).length;
  }

  void notifyProductList() {
    notifyListeners();
  }

  List<Product> get favoritesProducts {
    return _products.where((el) => el.isFavorite).toList();
  }
}
