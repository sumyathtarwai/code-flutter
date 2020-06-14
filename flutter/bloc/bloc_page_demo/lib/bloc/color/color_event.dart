part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

class ChangeColor extends ColorEvent {
  final Color color;
  ChangeColor(this.color);
}
