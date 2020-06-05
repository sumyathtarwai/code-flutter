enum Level {
  easy,
  challenging,
  intermediate,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
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

  get affordabilityValue {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      default:
        return 'TBD';
    }
  }

  get levelValue {
    switch (level) {
      case Level.easy:
        return 'Easy';
        break;
      case Level.challenging:
        return 'Challenging';
        break;
      case Level.intermediate:
        return 'Intermediate';
        break;
      case Level.hard:
        return 'Hard';
        break;
      default:
        return 'TBD';
    }
  }
}
