import 'dart:io';

void main() {
  Iterable<int> factorials = [
    fact(1),
    fact(2),
    fact(3),
    fact(4),
    fact(5),
    fact(0)
  ];
  print(factorials.join('\n'));
}

int fact(int value) => value == 0 ? 1 : value * fact(--value);
