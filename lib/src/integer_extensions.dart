import 'dart:io';

extension IntegerExtension on int {
  int factorial() {
    int value = this;
    for (int i = this - 1; i > 1; --i) {
      value *= i;
    }
    return value;
  }

  Iterable<int> prefixFactorial() sync* {
    int value = 1;
    yield value;
    for (int i = 2; i < this + 1; ++i) {
      value *= i;
      yield value;
    }
  }
}
