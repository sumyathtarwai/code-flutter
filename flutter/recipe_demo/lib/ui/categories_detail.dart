import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import 'recipe_item.dart';
import '../const.dart';

class CategoriesDetail extends StatelessWidget {
  const CategoriesDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final recipeList = dummyRecipe
        .where(
          (el) => el.categories.contains(
            routeData['id'],
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeData['categoryTitle'],
          style: appTextStyle.copyWith(fontSize: 20.0),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(recipeList[index]);
        },
        itemCount: recipeList.length,
      ),
    );
  }
}
