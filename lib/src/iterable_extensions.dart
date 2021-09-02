// ignore_for_file: omit_local_variable_types
// ignore_for_file: unnecessary_this

extension IterableExtensions<T> on Iterable<T> {
  Iterable<T> removeDuplicates() sync* {
    Set<T> items = {};
    for (T iter in this) {
      if (!items.contains(iter)) {
        items.add(iter);
        yield iter;
      }
    }
  }

  void forEachIndexed(void Function(int index, T element) action) {
    int index = 0;
    for (T element in this) {
      action(index++, element);
    }
  }
}

extension ComparableIterableExtension<T extends Comparable> on Iterable<T> {
  T max() => this.reduce((a, b) => a.compareTo(b) > 0 ? a : b);
  T min() => this.reduce((a, b) => a.compareTo(b) > 0 ? b : a);
}

extension NumIterableExtension<T extends num> on Iterable<T> {
  T sum() {
    num sum = 0;
    for (T element in this) {
      sum += element;
    }
    return sum as T;
  }

  Iterable<T> prefixSum() sync* {
    num sum = 0;
    for (T element in this) {
      sum += element;
      yield sum as T;
    }
  }
}
