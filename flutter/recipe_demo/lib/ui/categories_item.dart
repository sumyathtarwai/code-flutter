import 'package:flutter/material.dart';
import '../const.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Color color;

  const CategoryItem({Key key, this.id, this.title, this.imageUrl, this.color})
      : super(key: key);

  void _recipePagePath(BuildContext context) {
    Navigator.pushNamed(
      context,
      recipePagePath,
      arguments: {
        'id': id,
        'categoryTitle': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _recipePagePath(context),
      splashColor: color.withOpacity(0.4),
      child: Container(
        child: Center(
          child: FittedBox(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.5),
                    color.withOpacity(0.8),
                    color,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
