import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  const RecipePage(this.recipe, {Key key}) : super(key: key);

  void recipeDetail() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => recipeDetail,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                recipe.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              color: Theme.of(context).accentColor.withOpacity(0.5),
              child: Text(
                recipe.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
