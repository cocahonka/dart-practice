import 'dart:io';

const list = [4, 5, 6, 7, 2, 1, 2, 3, 4];

void main() {
  method_1();
  method_2();
}

void method_1() {
  print(list.reversed);
  stdout.write('\n\n');
}

void method_2() {
  for (int i = list.length - 1; i > -1; --i) {
    stdout.write('${list[i]} ');
  }
  stdout.write('\n\n');
}
