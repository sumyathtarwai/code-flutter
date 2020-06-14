part of 'color_bloc.dart';

@immutable
abstract class ColorState {}

class ColorInitial extends ColorState {}

class ColorPaint extends ColorState {
  final Color color;
  ColorPaint(this.color);
}
