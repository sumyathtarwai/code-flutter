import 'package:calculator/constants.dart';
import 'package:intl/intl.dart';

class Process {
  static bool isNum(String key) {
    if (key == null) {
      return false;
    }
    if (key == Keys.keyDecimal) {
      return true;
    }
    return double.tryParse(key) != null ? true : false;
  }

  static String calculate(String num1, String num2, String op) {
    switch (op) {
      case Keys.keyPercent:
        return (double.parse(num1) / 100).toString();
        break;
      case Keys.keyDivide:
        return (double.parse(num1) / double.parse(num2)).toString();
        break;
      case Keys.keyMultiply:
        return (double.parse(num1) * double.parse(num2)).toString();
        break;
      case Keys.keyMinus:
        return (double.parse(num1) - double.parse(num2)).toString();
        break;
      case Keys.keyPlus:
        return (double.parse(num1) + double.parse(num2)).toString();
        break;
      default: return '';
    }
  }

  static String display(String current, String key) {
    if (key == Keys.keyDecimal) {
      if (current.isEmpty) {
        return '0.';
      }
      return current.contains(Keys.keyDecimal) ? '' : key;
    }

    return (current.startsWith('0', 0) && current.length == 1) ? '' : key;
  }
}
