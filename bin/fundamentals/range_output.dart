import 'dart:io';
import 'package:practice/some_utils.dart';

Iterable<int> get positiveGenerator sync* {
  int i = 0;
  while (true) yield i++;
}

extension IntegerRanges on int {
  List<int> to(int end) =>
      List.generate(end - this, (int index) => this + index);
  List<int> toGenerateOld(int end) =>
      positiveGenerator.skip(this).take(end - this).toList();
  List<int> toGenerateNew(int end) => range(this, end).toList();
}

void main(List<String> args) {
  int begin = 23;
  int end = 35;
  method_1(begin, end);
  method_2(begin, end);
  method_3(begin, end);
  method_4(begin, end);
  method_5(begin, end);
  method_6(begin, end);
  method_7(begin, end);
  method_8(begin, end);
}

void method_1(int begin, int end) {
  for (; begin < end; ++begin) {
    stdout.write('$begin ');
  }
  stdout.write('\n\n');
}

void method_2(int begin, int end) {
  while (begin++ < end) {
    stdout.write('$begin ');
  }
  stdout.write('\n\n');
}

void method_3(int begin, int end) {
  List.generate(end - begin, (index) => begin + index).forEach((element) {
    stdout.write('$element ');
  });
  stdout.write('\n\n');
}

void method_4(int begin, int end) {
  positiveGenerator.skip(begin).take(end - begin).forEach((element) {
    stdout.write('$element ');
  });
  stdout.write('\n\n');
}

void method_5(int begin, int end) {
  for (final i in range(begin, end)) {
    stdout.write('$i ');
  }
  stdout.write('\n\n');
}

void method_6(int begin, int end) {
  begin.to(end).forEach((element) {
    stdout.write('$element ');
  });
  stdout.write('\n\n');
}

void method_7(int begin, int end) {
  begin.toGenerateOld(end).forEach((element) {
    stdout.write('$element ');
  });
  stdout.write('\n\n');
}

void method_8(int begin, int end) {
  begin.toGenerateNew(end).forEach((element) {
    stdout.write('$element ');
  });
  stdout.write('\n\n');
}
