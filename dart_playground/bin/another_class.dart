import 'bicycle_class.dart';

void main() {
  //instantiate
  //optional new keyword:
  var bike = Bicycle(2, 1);
// access private field will error
// bike._speed;
  print(bike.getSpeed);
// read-only
// bike.getSpeed = 10;
}
