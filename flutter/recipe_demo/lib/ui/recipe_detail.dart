import 'package:flutter/material.dart';
import 'package:recipe_demo/models/recipe.dart';

import '../models/dummy_data.dart';
import '../widgets/bottom_wave_image.dart';

class RecipeDetail extends StatelessWidget {
  final Function favoriteSetting;
  final List<Recipe> favoriteList;
  const RecipeDetail({Key key, this.favoriteSetting, this.favoriteList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context).settings.arguments;
    final recipe = dummyRecipe.firstWhere((el) => el.id == arg);
    final media = MediaQuery.of(context);
    final mediaHeight = (media.size.height - media.padding.top);
    final ThemeData themeOf = Theme.of(context);
    bool isCurrentFavorite = favoriteList?.any((el) => el.id == arg);
    return Scaffold(
      //   backgroundColor: themeOf.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _buildAppBar(mediaHeight, recipe, context),
            _buildTitleSection(mediaHeight, recipe, themeOf, context),
            ..._buildIngredientSection(media, themeOf, recipe),
            _buildStepsSection(media, themeOf, recipe),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favoriteSetting(recipe.id),
        child: isCurrentFavorite
            ? Icon(
                Icons.favorite,
                color: themeOf.buttonColor,
              )
            : Icon(
                Icons.favorite_border,
              ),
      ),
    );
  }

  Widget _buildAppBar(double mediaHeight, Recipe recipe, BuildContext context) {
    return Container(
      height: mediaHeight * 0.32,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: mediaHeight * 0.32,
            child: BottomWaveImage(
              Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme:
                  Theme.of(context).iconTheme.copyWith(color: Colors.white),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIngredientSection(
      MediaQueryData media, ThemeData themeOf, Recipe recipe) {
    return [
      Container(
        height: media.size.height * 0.05,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Ingredients'.toUpperCase(),
          style: themeOf.textTheme.headline4.copyWith(
            color: Colors.blueGrey,
          ),
        ),
      ),
      Container(
        height: media.size.height * 0.18,
        width: media.size.width * 0.95,
        color: themeOf.primaryColorDark,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 2),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 6, color: themeOf.dividerColor),
                ),
              ),
              child: RichText(
                softWrap: true,
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: '${String.fromCharCode(0x2022)} ',
                  style: themeOf.textTheme.subtitle1.copyWith(
                    color: themeOf.primaryColorLight,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: recipe.ingredients[index],
                      style: themeOf.textTheme.subtitle1
                          .copyWith(letterSpacing: 0.8),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: recipe.ingredients.length,
        ),
      )
    ];
  }

  Widget _buildRecipeInfo(BuildContext context, {IconData icon, String text}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Icon(icon),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepsSection(
      MediaQueryData media, ThemeData themeOf, Recipe recipe) {
    return Container(
      height: media.size.height * 0.4,
      color: Colors.white70,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text(
                  '${index + 1}',
                  style: themeOf.textTheme.headline4.copyWith(
                    color: themeOf.iconTheme.color,
                  ),
                ),
              ),
            ),
            title: Text(
              recipe.steps[index],
              textAlign: TextAlign.justify,
              softWrap: true,
              style: themeOf.textTheme.subtitle1.copyWith(
                color: Colors.black,
              ),
            ),
          );
        },
        itemCount: recipe.steps.length,
      ),
    );
  }

  Widget _buildTitleSection(double mediaHeight, Recipe recipe,
      ThemeData themeOf, BuildContext context) {
    return Container(
      height: mediaHeight * 0.06,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              recipe.title,
              style: themeOf.textTheme.caption,
              softWrap: true,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildRecipeInfo(
                  context,
                  icon: Icons.timer,
                  text: '${recipe.duration.toInt()} min',
                ),
                _buildRecipeInfo(
                  context,
                  icon: Icons.format_list_numbered_rtl,
                  text: recipe.levelValue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
