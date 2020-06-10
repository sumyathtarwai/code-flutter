import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  Filter({
    this.isGlutenFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
    this.isLactoseFree = false,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        isGlutenFree,
        isVegan,
        isVegetarian,
        isLactoseFree,
      ];
}
