import 'package:flutter/material.dart';
import '../const.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({Key key, this.id, this.title, this.color})
      : super(key: key);

  void categoriesDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      categoriesDetailPath,
      arguments: {
        'id': id,
        'categoryTitle': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => categoriesDetail(context),
      splashColor: color.withOpacity(0.4),
      child: Container(
        child: Center(
          child: FittedBox(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
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
    );
  }
}
