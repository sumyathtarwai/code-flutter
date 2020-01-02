import 'package:calculator/constants.dart';
import 'package:intl/intl.dart';

class Process {
  static bool isNum(String key) {
    if (key == null) {
      return false;
    }

    return int.tryParse(key) != null ? true : false;
  }
}
