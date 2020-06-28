import 'package:flutter/widgets.dart';

import 'pages/pages.dart';

class RouteName {
  static const home = '/';
  static const productDetail = 'prod/detail';
  static const cart = 'cart';
  static const order = 'order';
  static const adminProduct = 'admin/product';

  static final Map<String, Widget Function(BuildContext)> route = {
    home: (ctx) => const ProductHome(),
    productDetail: (ctx) => const ProductDetail(),
    cart: (ctx) => const CartHome(),
    order: (ctx) => const OrderHome(),
    adminProduct: (ctx) => const AdminProductHome(),
  };
}
