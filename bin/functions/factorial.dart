import 'dart:io';
import 'package:practice/some_utils.dart';

void main() {
  stdout.write('${method_1(10)}\n\n');
  stdout.write('${method_2(10)}\n\n');
  stdout.write('${method_3(10)}\n\n');
  stdout.write('${method_4(10)}\n\n');
  stdout.write('${method_5(10)}\n\n');
}

int method_1(int value) {
  for (int i = value - 1; i > 1; --i) {
    value *= i;
  }
  return value;
}

int method_2(int value) {
  if (value == 0) {
    return 1;
  }
  return value * method_2(value - 1);
}

int method_3(int value) => value.factorial();

int method_4(int value) => value.prefixFactorial().last;

int method_5(int value) => value == 0 ? 1 : value * method_5(--value);
