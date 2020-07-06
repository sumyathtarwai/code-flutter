//import 'dart:convert';

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import '../exception/network_exception.dart';
import '../network/rest_client.dart';
//import 'package:http/http.dart' as http;
import '../service_locator.dart';
import 'modal.dart';

class ProductList with ChangeNotifier {
  //int id;
  //static final List<ProductItem> _products = [...dummyProduct];
  // Inject  Api
  final RestClient _api = locator<RestClient>();
  final List<ProductItem> _products = [];

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

  Future<List<ProductItem>> fetchProducts() async {
    try {
      Map<String, ProductItem> response = await _api.getProducts();

      final data =
          response.entries.map((e) => e.value.mapWithId(e.key)).toList();

      _products.clear();
      _products.addAll(data);
      notifyListeners();
      return data;
    } catch (e) {
      throw NetworkException(e);
    }
  }

  Future<void> addProduct(ProductItem product) async {
    try {
      HttpResponse res = await _api.addProduct(product);
      final id = res.data["name"];
      _products.add(product.copyWith(id: id));
      notifyListeners();
      return res;
    } catch (e) {
      throw NetworkException(e);
    }
  }

  Future<void> updateProduct(ProductItem product) async {
    if (product.id.isNotEmpty) {
      var i = _products.indexWhere((element) => element.id == product.id);
      if (i >= 0) {
        try {
          // check value is updated or not [equaltable]
          if (product == _products[i]) {
            return;
          }
          await _api.updateProductPart(product.id, product.toJson());
          _products[i] = product;
          notifyListeners();
        } catch (e) {
          throw NetworkException(e);
        }
      }
    }
  }

  Future<Map<String, Object>> removeProduct(String id) async {
    var i = _products.indexWhere((el) => el.id == id);
    var product;
    if (i >= 0) {
      try {
        await _api.deleteProduct(id);
        product = _products.removeAt(i);
      } catch (e) {
        await _api.addProduct(product);
        _products.insert(i, product);
        throw NetworkException(e);
      }
      notifyListeners();
      return {'index': i, 'product': product};
    }
    return {};
  }

  Future<void> undoRemove(Map<String, Object> map) async {
    if (map != null) {
      try {
        _products.insert(map['index'], map['product']);
        notifyListeners();
        await _api.addProduct(map['product']);
      } catch (e) {
        throw NetworkException(e);
      }
    }
  }
}
