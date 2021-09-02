import 'dart:io';
import 'dart:math';

import 'output_with_different_steps.dart';

const a = 5;
const b = 7;
const c = 3;

void main() {
  method_1();
  method_2();
}

void method_1() {
  int max = 0;
  int min = 0;
  if (a >= b && a >= c) {
    max = a;
  } else if (b >= a && b >= c) {
    max = b;
  } else {
    max = c;
  }
  print('max is $max');
  if (a <= b && a <= c) {
    min = a;
  } else if (b <= a && b <= c) {
    min = b;
  } else {
    min = c;
  }
  print('min is $min');
  stdout.write('\n');
}

void method_2() {
  print('max is ${max(max(a, b), c)}');
  print('min is ${min(min(a, b), c)}');
  print('\n');
}
