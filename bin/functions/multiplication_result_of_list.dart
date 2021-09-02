import 'dart:io';

const list = [5, 0.5, 8, 1.2, 0.2, 10, 0.125, 3];

void main() {
  stdout.write('${method_1(list)}\n\n');
  stdout.write('${method_2(list)}\n\n');
}

T method_1<T extends num>(Iterable<T> iterable) =>
    iterable.reduce((value, element) => value * element as T);

T method_2<T extends num>(Iterable<T> iterable) {
  num value = iterable.first;
  for (T element in iterable.skip(1)) {
    value *= element;
  }
  return value as T;
}
