import 'dart:io';

const list = [4, 5, 6, 7, 2, 1, 2, 3, 4];
const forbiddenValues = [2, 6];
void main() {
  method_1();
  method_2();
}

void method_1() {
  for (int element in list) {
    if (!forbiddenValues.contains(element)) {
      stdout.write('$element ');
    }
  }
  stdout.write('\n');
}

void method_2() {
  print(list.where((element) => !forbiddenValues.contains(element)));
  stdout.write('\n');
}
