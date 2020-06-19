import 'package:flutter/widgets.dart';
import 'pages/product_detail.dart';

import 'pages/product_home.dart';

class RouteName {
  static const home = '/';
  static const productDetail = 'prod/detail';

  static final Map<String, Widget Function(BuildContext)> route = {
    home: (ctx) => const ProductHome(),
    productDetail: (ctx) => const ProductDetail(),
  };
}
