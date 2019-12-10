// on clause for except exception
// catch clause can be used when which exception is thrown
// implements Exception for custom exception

void main(List<String> args) {
  //exceptionTest();
  try {
    deposit(-0);
  } on EmptyException {
    print(EmptyException().errorMessage());
  }
}

void exceptionTest() {
  try {
    var result = 12 ~/ 0;
    print(result);
  } on IntegerDivisionByZeroException {
    print('IntegerDivisionByZeroException handle');
  }

  print('');
  try {
    var result = 12 ~/ 0;
    print(result);
  } catch (e, s) {
    print('$e is throw, trace $s');
  } finally {
    print('FINALLY');
  }
}

// custom exception
class EmptyException implements Exception {
  String errorMessage() => 'Please deposit money!!';
}

void deposit(int amount) {
  if (amount <= 0) throw EmptyException();
}
