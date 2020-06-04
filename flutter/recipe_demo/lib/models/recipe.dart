enum Level {
  Easy,
  Challenging,
  Intermediate,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Recipe {
  final String id;
  final String imageUrl;
  final List<String> categories;
  final String title;
  final String remark1;
  final String remark2;
  final List<String> ingredients;
  final List<String> steps;
  final double duration;
  final Level level;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Recipe({
    this.id,
    this.title,
    this.categories,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.duration,
    this.level,
    this.affordability,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
    this.remark1,
    this.remark2,
  });
}
