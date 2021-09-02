Iterable<int> range(int begin, int end, [int step = 1]) sync* {
  for (; begin < end; begin += step) {
    yield begin;
  }
}
