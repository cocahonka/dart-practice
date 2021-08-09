import 'dart:collection';
import 'dart:io';
import 'package:practice/some_utils.dart';

const list = [1, 3, 4, 1, 4, 5, 7, 3, 8, 5];

void main() {
  method_1();
  method_2();
  method_3();
  method_4();
}

void method_1() {
  stdout.write('${list.toSet()}\n\n');
}

void method_2() {
  stdout.write('${[
    ...{...list}
  ]}\n\n');
}

void method_3() {
  stdout.write('${Set.from(list)}\n\n');
}

void method_4() {
  stdout.write('${list.removeDuplicates()}\n\n');
}
