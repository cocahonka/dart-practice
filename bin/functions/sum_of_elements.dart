import 'dart:io';

import 'package:practice/some_utils.dart';

const List<int> listOfIntegers = [5, 7, 3, 2, 1];
const List<double> listOfDoubles = [5.5, 8.5, 3.3, 2.8];
const List<num> listOfNums = [5, 7, 3, 2, 1, 5.5, 8.5, 3.3, 2.8];
void main() {
  stdout.write('${method_1(listOfIntegers)}\n\n');
  stdout.write('${method_2(listOfDoubles)}\n\n');
  stdout.write('${method_3(listOfNums)}\n\n');
  stdout.write(listOfIntegers.prefixSum().takeWhile((value) => value <= 15));
}

T method_1<T extends num>(Iterable<T> iterable) => iterable.sum();

T method_2<T extends num>(Iterable<T> iterable) {
  num sum = 0;
  for (T element in iterable) {
    sum += element;
  }
  return sum as T;
}

T method_3<T extends num>(Iterable<T> iterable) =>
    iterable.reduce((value, element) => (value + element) as T);
