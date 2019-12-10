class Color {
  int red;
  int green;
  int blue;
  var other;

  Color(this.red, this.green, this.blue) : other = 'other';

  // Create a named constructor called "black" here and redirect it
  // to call the existing constructor
  Color.black() : this(0, 0, 0);

  @override
  String toString() => 'red $red, green $green, blue $blue, extra $other';
}

void main(List<String> args) {
  print(Color.black());
}
