import 'dart:collection';
import 'package:practice/some_utils.dart';

void main(List<String> args) {
  var str = input('Введите строку :: ');
  method_1(str);
  method_2(str);
  method_3(str);
  method_4(str);
  method_5(str);
  method_6(str);
}

void method_1(String str) {
  var symbolsMap = HashMap<String, int>();

  for (var i = 0; i < str.length; ++i) {
    symbolsMap.update(str[i], (value) => ++value,
        ifAbsent: () => symbolsMap[str[i]] = 1);
  }

  symbolsMap.forEach((key, value) {
    print('$key :: $value');
  });
  print('\n');
}

void method_2(String str) {
  var symbolsMap = HashMap<String, int>();

  str.split('').forEach((element) {
    symbolsMap.update(element, (value) => ++value,
        ifAbsent: () => symbolsMap[element] = 1);
  });

  symbolsMap.forEach((key, value) {
    print('$key :: $value');
  });
  print('\n');
}

void method_3(String str) {
  var symbolsMap = HashMap<String, int>();

  for (int i = 0; i < str.length; i++) {
    int count = symbolsMap[str[i]] ?? 0;
    symbolsMap[str[i]] = count + 1;
  }

  symbolsMap.forEach((key, value) {
    print('$key :: $value');
  });
  print('\n');
}

void method_4(String str) {
  var symbolsMap = HashMap<String, int>();

  str.split('').forEach((element) {
    int count = symbolsMap[element] ?? 0;
    symbolsMap[element] = ++count;
  });

  symbolsMap.forEach((key, value) {
    print('$key :: $value');
  });
  print('\n');
}

void method_5(String str) {
  var symbolsMap = HashMap<String, int>();

  for (int i = 0; i < str.length; ++i) {
    symbolsMap[str[i]] = symbolsMap.putIfAbsent(str[i], () => 0) + 1;
  }

  symbolsMap.forEach((key, value) {
    print('$key :: $value');
  });
  print('\n');
}

void method_6(String str) {
  var symbolsMap = HashMap<String, int>();

  str.split('').forEach((element) {
    symbolsMap[element] = symbolsMap.putIfAbsent(element, () => 0) + 1;
  });

  symbolsMap.forEach((key, value) {
    print('$key :: $value');
  });
  print('\n');
}
