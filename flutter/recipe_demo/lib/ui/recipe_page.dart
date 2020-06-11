import 'package:flutter/material.dart';

import '../const.dart';
import '../models/recipe.dart';
import 'recipe_item.dart';

class RecipePage extends StatelessWidget {
  final List<Recipe> recipeList;
  const RecipePage({
    this.recipeList,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    var filterData = recipeList
        .where(
          (el) => el.categories.contains(
            routeData['id'],
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        elevation: 0,
        title: Text(
          routeData['categoryTitle'],
          style: appTextStyle,
        ),
      ),
     // drawer: DrawerWidget(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(filterData[index]);
        },
        itemCount: filterData.length,
      ),
    );
  }
}
