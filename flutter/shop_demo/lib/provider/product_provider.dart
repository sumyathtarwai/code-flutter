import 'package:flutter/foundation.dart';

import '../modal/modal.dart';

class ProductNotifer with ChangeNotifier {
  List<Product> _products = [...dummyProduct];

  List<Product> get products {
    return [..._products];
  }

  Product whereId(String id) {
    return _products.firstWhere((el) => id == el.id);
  }

  void addProducts(Product val) {
    //_products.add(val);
    notifyListeners();
  }
}
