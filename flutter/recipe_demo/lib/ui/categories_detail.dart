import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import 'recipe_page.dart';

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
        title: Text(routeData['categoryTitle']),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipePage(recipeList[index]);
        },
        itemCount: recipeList.length,
      ),
    );
  }
}
