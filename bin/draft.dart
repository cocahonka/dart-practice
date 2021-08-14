import 'package:practice/some_utils.dart';

const Iterable<int> myIterable = [5, 8, 5, 3, 2, 5];
const int myNumber = 5;

void main() {
  myIterable.forEachIndexed(
      (index, element) => index % 2 != 0 ? print(element) : null);
}
