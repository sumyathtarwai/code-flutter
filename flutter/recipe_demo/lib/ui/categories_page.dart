import 'package:flutter/material.dart';
import './categories_item.dart';
import '../models/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage();

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      children: dummyCategories
          .map((e) => CategoryItem(
                id: e.id,
                title: e.title,
                imageUrl: e.imageUrl,
                color: e.color,
              ))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
