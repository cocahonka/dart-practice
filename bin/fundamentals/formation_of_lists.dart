import 'dart:io';
import 'package:practice/some_utils.dart';

List<int> listFromRange(int begin, int end) => range(begin, end).toList();

void main() {
  var list = listFromRange(0, 100);
  method_1(list);
  method_2(list);
  method_3(list);
  method_4(list);
  method_5(list);
}

void method_1(List<int> list) {
  var new_list = [...list]..removeWhere((element) => element % 5 != 0);
  print(new_list);
  stdout.write('\n\n');
}

void method_2(List<int> list) {
  var new_list = List.from(list);
  new_list = new_list.where((element) => element % 5 == 0).toList();
  print(new_list);
  stdout.write('\n\n');
}

void method_3(List<int> list) {
  var new_list = list.where((element) => element % 5 == 0).toList();
  print(new_list);
  stdout.write('\n\n');
}

void method_4(List<int> list) {
  var new_list = [
    for (int i = 0; i < list.length; ++i)
      if (list[i] % 5 == 0) i
  ];
  print(new_list);
  stdout.write('\n\n');
}

void method_5(List<int> list) {
  var new_list = [
    for (int item in list)
      if (item % 5 == 0) item
  ];
  print(new_list);
  stdout.write('\n\n');
}
