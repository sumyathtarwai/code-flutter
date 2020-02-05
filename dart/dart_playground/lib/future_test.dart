Future<String> greet(String name) async {
  return await getName(name);
}

Future<String> getName(String name) async {
  return await Future.delayed(Duration(seconds: 5), () => name);
}

Stream<int> createNumStream(int num) async* {
  for (var i = 0; i < num; i++) {
    yield i;
  }
}

Future<void> printStreamNum(Stream<int> stream) async {
  await for (var num in stream) {
    await Future.delayed(Duration(seconds: 1));
    print(num);
  }
}

Future<void> main() async {
  var stream = createNumStream(5).asBroadcastStream();
  printStreamNum(stream);
  printStreamNum(stream);
}
