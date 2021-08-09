import 'dart:io';

const list = [4, 5, 6, 7, 30, 22, 2, 39, 41];

T sumFunction<T extends num>(T a, T b) => (a + b) as T;
void main() {
  method_1();
}

void method_1() {
  //int sum = list.reduce((value, element) => value + element);
  int sum = list.reduce(sumFunction);
  int averge = (sum / list.length).round();
  print(averge);
}
