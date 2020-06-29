import 'package:flutter/foundation.dart';

import 'modal.dart';

class ProductList with ChangeNotifier {
  //int id;
  static final List<ProductItem> _products = [...dummyProduct];

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

  void addProduct(ProductItem product) {
    _products.add(
      ProductItem(
        id: DateTime.now().toString(),
        title: product.title,
        desc: product.desc,
        price: product.price,
        imageUrl: product.imageUrl,
        displayQty: product.displayQty,
        color: product.color,
        size: product.size,
        isFavorite: false,
      ),
    );
    notifyListeners();
  }

  void updateProduct(ProductItem product) {
    if (product.id.isNotEmpty) {
      var i = _products.indexWhere((element) => element.id == product.id);
      if (i >= 0) {
        _products[i] = ProductItem(
          id: product.id,
          title: product.title,
          desc: product.desc,
          price: product.price,
          imageUrl: product.imageUrl,
          displayQty: product.displayQty,
          color: product.color,
          size: product.size,
          isFavorite: product.isFavorite,
        );
        notifyListeners();
      }
    }
  }

  Map<String, Object> removeProduct(String id) {
    var i = _products.indexWhere((el) => el.id == id);
    // _products.removeWhere((el) => el.id == id);
    if (i >= 0) {
      var product = _products.removeAt(i);
      notifyListeners();
      return {'index': i, 'product': product};
    }
    return {};
  }

  void undoRemove(Map<String, Object> map) {
    if (map != null) {
      _products.insert(map['index'], map['product']);
      notifyListeners();
    }
  }
}
