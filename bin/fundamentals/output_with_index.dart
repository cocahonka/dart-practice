import 'dart:io';
import 'dart:math';
import 'package:practice/some_utils.dart';

const list = [4, 5, 6, 7, 2, 1, 2, 3, 4];
const int intMaxValue = 4294967296;

void main() {
  method_1();
  method_2();
  method_3();
}

void method_1() {
  for (int i = 0; i < list.length; ++i) {
    stdout.write('el => ${list[i]} index => $i\n');
  }
  stdout.write('\n');
}

void method_2() {
  list.asMap().forEach((i, el) {
    stdout.write('el => ${list[i]} index => $i\n');
  });
  stdout.write('\n');
}

void method_3() {
  list.forEachIndexed((index, element) {
    stdout.write('el => $element index => $index\n');
  });
}
