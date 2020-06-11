import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../ui/recipe_item.dart';

class FavoritesPage extends StatefulWidget {
  final Function favoriteSetting;
  final List<Recipe> current;
  const FavoritesPage({Key key, this.current, this.favoriteSetting})
      : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Recipe> recipeList;
  @override
  void initState() {
    recipeList = widget.current;
    super.initState();
  }

  void update(String id) {
    widget.favoriteSetting(id);
    setState(() {
      recipeList = widget.current;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: recipeList.isEmpty
          ? Container(
              padding: EdgeInsets.all(50),
              child: Text('No Favorite Recipe is Added yet.',
                  style: Theme.of(context).textTheme.headline2),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return RecipeItem(recipeList[index],
                    fromFavoritePage: true, callback: update);
              },
              itemCount: recipeList.length,
            ),
    );
  }
}
