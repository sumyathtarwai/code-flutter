import 'package:flutter/material.dart';
import 'package:recipe_demo/models/recipe.dart';
import '../models/dummy_data.dart';

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
          ListTileTheme();
          return ListTile(
            leading: Image.network(recipeList[index].imageUrl),
            title: Text(
              recipeList[index].title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              recipeList[index].level.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Text(
              recipeList[index].affordability.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        },
        itemCount: recipeList.length,
      ),
    );
  }
}
