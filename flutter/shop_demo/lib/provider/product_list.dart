//import 'dart:convert';

import 'dart:async';

import 'package:dio/dio.dart';
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
          response?.entries?.map((e) => e.value.copyWith(id: e.key))?.toList();

      _products.clear();
      _products.addAll(data);
      notifyListeners();
      return data;
    } catch (e) {
      switch (e.runtimeType) {
        case DioError:
          throw NetworkException(e);
          break;
        default:
      }
    }
    return null;
  }

  Future<void> addProduct(ProductItem product) async {
    try {
      HttpResponse res = await _api.addProduct(product);
      final id = res.data["name"];
      _products.add(product.copyWith(id: id));
      notifyListeners();
      return res;
    } catch (e) {
      switch (e.runtimeType) {
        case DioError:
          throw NetworkException(e);
          break;
        default:
      }
    }
  }

  Future<void> updateProduct(ProductItem product) async {
    if (product.id.isNotEmpty) {
      var i = _products.indexWhere((element) => element.id == product.id);
      if (i >= 0) {
        // check value is updated or not [equaltable]
        if (product == _products[i]) {
          return;
        }
        var temp = _products[i];
        _products[i] = product;

        try {
          await _api.updateProductPart(product.id, product.toJson());
          notifyListeners();
        } catch (e) {
          // rollback
          _products[i] = temp;
          temp = null;
          notifyListeners();
          switch (e.runtimeType) {
            case DioError:
              throw NetworkException(e);
              break;
            default:
          }
        }
      }
    }
  }

  Future<Map<String, Object>> removeProduct(String id) async {
    var i = _products.indexWhere((el) => el.id == id);

    if (i >= 0) {
      var product = _products.removeAt(i);

      try {
        await _api.deleteProduct(id);
        notifyListeners();
      } catch (e) {
        // rollback
        await _api.addProduct(product);
        _products.insert(i, product);
        product = null;
        notifyListeners();
        switch (e.runtimeType) {
          case DioError:
            throw NetworkException(e);
            break;
          default:
        }
      }
      return {'index': i, 'product': product};
    }
    return {};
  }

  Future<void> undoRemove(Map<String, Object> map) async {
    if (map != null) {
      try {
        _products.insert(map['index'], map['product']);
        await _api.addProduct(map['product']);
        notifyListeners();
      } catch (e) {
        switch (e.runtimeType) {
          case DioError:
            throw NetworkException(e);
            break;
          default:
        }
      }
    }
  }
}
