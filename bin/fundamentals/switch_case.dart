import 'dart:io';
import 'package:practice/some_utils.dart';

void main() {
  method_1();
}

void method_1() {
  for (int number in range(1, 6)) {
    switch (number) {
      case 1:
        stdout.write('it is one\n');
        break;
      case 2:
        stdout.write('it is two\n');
        break;
      case 3:
        stdout.write('it is three\n');
        break;
      case 4:
        stdout.write('it is four\n');
        break;
      default:
        stdout.write('it is five\n');
    }
    stdout.write('\n');
  }
}
