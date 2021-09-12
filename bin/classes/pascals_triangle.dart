class PascalsTriangle {
  List<List<int>> rows(int numberOfRows) =>
      _triangleRow().take(numberOfRows).toList();

  Iterable<List<int>> _triangleRow([List<int> prevRow = const []]) sync* {
    var newRow = _newRow(prevRow);
    yield newRow;
    yield* _triangleRow(newRow);
  }

  List<int> _newRow(List<int> prevRow) =>
      [1] +
      List.generate(prevRow.length, (index) => _newValueInRow(prevRow, index));

  int _newValueInRow(List<int> prevRow, int index) =>
      prevRow.skip(index).take(2).reduce((first, second) => first + second);
}
