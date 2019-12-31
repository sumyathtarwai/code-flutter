import 'package:flutter/material.dart';
import 'package:layout_demo/ui/avatar_demo.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCard(
      'Alice',
      'Flutter Development Team',
      '+95097233444',
      'alice@wonderland.com',
    );
  }
}
