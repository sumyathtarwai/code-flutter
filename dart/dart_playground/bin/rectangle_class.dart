import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  //optional named parameter {} with default value, can also use optional positional []
  //not both (named & positional) in the same function !!
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

void main() {
  //named parameter
  print(Rectangle(origin: const Point(10, 10), width: 100, height: 200));
  print(Rectangle(origin: const Point(100, 100)));
  print(Rectangle(height: 200));
  print(Rectangle());
}
