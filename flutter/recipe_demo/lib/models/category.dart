import 'dart:ui';

import 'package:flutter/foundation.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;

  const Category({
    @required this.id,
    @required this.title,
    @required this.color,
    @required this.imageUrl,
  });
}
