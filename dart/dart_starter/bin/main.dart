import 'class_collection/classes.dart';

void main(List<String> arguments) {
  //variableTest();
  //equalTest();
  listTest();
}

void variableTest() {
  var batch = 'Batch 2';
  var greet = 'Hello Dart from FDF#2';
  var testNum = 56;
  print(batch);
  print('$greet');
  print(testNum);

  // object
  var myObject = TestObject(myNum: 5);

  print('Object ${myObject.myNum}');

  // constant
  print('Constant $globalGreet');

  //multiline
  print('---------mutli start---------');
  var multi = '''<h1> Hello </h1>
  <p> </p>''';

  print(multi);
  print('---------mutli end---------');
}

void equalTest() {
  // == equal
  var i = 10;
  var j = 10;

  var value = (i == j);
  print(value);

  //
  var str1 = 'a';
  var str2 = 'a';
  print(str1 == str2);
  print(identical(str1, str2));

  //var num = (10 is i);
}

/// List Test
void listTest() {
  var array = [1, 2, 'a', 'b'];
  print(array);
  array.forEach((f) => print(f));

  var empty = [];
  empty.forEach((f) => empty.add(f));
}
