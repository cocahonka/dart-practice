const Iterable<int> myIterable = [5, 8, 5, 3, 2, 5];
const int myNumber = 5;

void main() {
  method_1();
  method_2();
}

void method_1() {
  int count = 0;
  for (int iter in myIterable) {
    if (iter == myNumber) {
      count++;
    }
  }
  print(count);
}

void method_2() {
  print(myIterable.where((element) => element == myNumber).length);
}
