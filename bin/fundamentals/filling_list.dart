void main() {
  method_1();
  method_2();
  method_3();
  method_4();
}

Iterable<int> get range100 sync* {
  for (int i = 0; i < 100; ++i) yield i;
}

void method_1() {
  print(Iterable<int>.generate(100));
  print('\n');
}

void method_2() {
  print(List.generate(100, (index) => index));
  print('\n');
}

void method_3() {
  print(range100);
  print('\n');
}

void method_4() {
  print([for (int i = 0; i < 100; ++i) i]);
  print('\n');
}
