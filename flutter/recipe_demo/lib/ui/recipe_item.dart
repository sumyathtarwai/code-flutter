import 'package:flutter/material.dart';
import '../const.dart';
import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem(this.recipe, {Key key}) : super(key: key);

  void recipeDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      recipesDetailPath,
      arguments: recipe.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Image.network(
        recipe.imageUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
    var recipeName = Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      color: Colors.black45,
      child: Text(
        recipe.title,
        style: Theme.of(context).textTheme.headline6,
        //  softWrap: true,
        // overflow: TextOverflow.fade,
      ),
    );
    return InkWell(
      onTap: () => recipeDetail(context),
      child: Card(
        color: Theme.of(context).accentColor.withOpacity(0.8),
        margin: EdgeInsets.all(10),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                image,
                Positioned.directional(
                  end: 0,
                  bottom: 20,
                  textDirection: TextDirection.ltr,
                  child: recipeName,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildInfo(
                    context,
                    icon: Icons.timer,
                    text: '${recipe.duration.toInt()} min',
                  ),
                  buildInfo(
                    context,
                    icon: Icons.format_list_numbered_rtl,
                    text: recipe.levelValue,
                  ),
                  buildInfo(
                    context,
                    icon: Icons.monetization_on,
                    text: recipe.affordabilityValue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildInfo(BuildContext context, {IconData icon, String text}) {
    return Row(
      children: <Widget>[
        Icon(icon),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
