import 'dart:io';
import 'dart:math';
import 'package:practice/some_utils.dart';

const list = [8, 12, 3];

void main() {
  StringBuffer buffer = StringBuffer();
  buffer.write(method_1(list[0], list[1], list[2]));
  buffer.write('\n\n');
  buffer.write(method_2(list[0], list[1], list[2]));
  buffer.write('\n\n');
  buffer.write(method_3(list[0], list[1], list[2]));
  buffer.write('\n\n');
  buffer.write(method_4(list[0], list[1], list[2]));
  stdout.write(buffer);
}

T maxAny<T extends Comparable>(T a, T b) => a.compareTo(b) > 0 ? a : b;

T method_1<T extends Comparable>(T a, T b, T c) => a.compareTo(b) > 0
    ? (a.compareTo(c) > 0 ? a : c)
    : (b.compareTo(c) > 0 ? b : c);

T method_2<T extends Comparable>(T a, T b, T c) =>
    <T>[a, b, c].reduce((a, b) => a.compareTo(b) > 0 ? a : b);

T method_3<T extends Comparable>(T a, T b, T c) => <T>[a, b, c].reduce(maxAny);

T method_4<T extends Comparable>(T a, T b, T c) => [a, b, c].max();
