import 'dart:io';
import 'package:practice/some_utils.dart';

const int begin = -35;
const int end = -1;
const List<int> steps = [1, 4, 7];

void main() {
  method_1();
  method_2();
}

void method_1() {
  for (int step in steps) {
    for (int i = begin; i < end; i += step) {
      stdout.write('$i ');
    }
    stdout.write('\n');
  }
  print('\n');
}

void method_2() {
  for (int step in steps) {
    range(begin, end, step).forEach((element) {
      stdout.write('$element ');
    });
    stdout.write('\n');
  }
  print('\n');
}
