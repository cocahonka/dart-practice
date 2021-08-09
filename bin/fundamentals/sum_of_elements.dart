import 'dart:io';
import 'package:practice/some_utils.dart' as utils;

const list = [4, 5, 6, 7, 2, 1, 2, 3, 4];

void main() {
  method_1();
  method_2();
  method_3();
  method_4();
  method_5();
  method_6();
}

void method_1() {
  int sum = 0;
  for (int i = 0; i < list.length; ++i) {
    sum += list[i];
  }
  stdout.write('sum is $sum\n\n');
}

void method_2() {
  int sum = 0;
  for (int item in list) {
    sum += item;
  }
  stdout.write('sum is $sum\n\n');
}

void method_3() {
  int sum = 0;
  list.forEach((el) => sum += el);
  stdout.write('sum is $sum\n\n');
}

void method_4() {
  int sum = list.fold(0, (previousValue, element) => previousValue + element);
  stdout.write('sum is $sum\n\n');
}

void method_5() {
  int sum = list.reduce((value, element) => value + element);
  stdout.write('sum is $sum\n\n');
}

void method_6() {
  int sum = list.reduce((a, b) => a + b);
  stdout.write('sum is $sum\n\n');
}
