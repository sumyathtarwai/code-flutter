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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        elevation: 0,
        title: Text(
          routeData['categoryTitle'],
          style: appTextStyle,
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
