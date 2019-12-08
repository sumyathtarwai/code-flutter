void main() {
  var animal = Animal(name: 'Bo Bo', color: 'Red');
  var dog = Dog('Po Po', 'White');
  dog.bark();
  dog.runWithLegs();
  dog.playWild();

  // exception
  var leg = '5';
  try {
    var testLeg = int.parse(leg);
  } on FormatException {
    leg = '4';
  }
}

class Canis {
  int legs = 4;

  void runWithLegs() {
    print('Run 4');
  }
}

class Play {
  void playWild() {
    print('Play Wild');
  }
}

class Animal {
  String name;
  String color;

// constructor
  Animal({this.name, this.color});
}

// Mixin
class Dog extends Animal with Canis, Play {
  Dog(String name, String color) : super(name: name, color: color);

  void bark() {
    print('woof');
  }
}
