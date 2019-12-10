class Bicycle {
  // default generate getter/setter for all public field
  int cadence;
  int gear;

  // private field
  int _speed = 0;

  // getter
  int get getSpeed => _speed;

  //constructor has no body, which is valid in Dart.
  Bicycle(this.cadence, this.gear);

  // named constructor
  Bicycle.specialBike() {
    cadence = 100;
    gear = 10;
    _speed = 200;
  }

//string interpolation, ${expression}
//fat arrow (=>) for one line function
  @override
  String toString() => 'Bicycle $cadence, $_speed mph, $gear';

  // function
  void breakIt(int decrement) => _speed -= decrement;

  void speedIt(int increase) => _speed += increase;
}

void main() {
  //instantiate
  //optional new keyword:
  var bike = Bicycle(2, 1);
  // bike.gear =5;
  print(bike);

  // named constructor invoke
  print(Bicycle.specialBike());
}
