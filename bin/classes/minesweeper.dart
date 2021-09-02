import 'dart:math';

class Minesweeper {
  static const _mine = '*';
  List<String> _mineField;
  List<String> annoted = [];

  Minesweeper(this._mineField) {
    _mineField.asMap().forEach((y, row) {
      var annotatedRow = <String>[];
      row.split('').asMap().forEach((x, value) {
        annotatedRow.add((value == _mine) ? _mine : _count_mines(x, y));
      });
      annoted.add(annotatedRow.join());
    });
  }

  String _count_mines(int x, int y) {
    var maxY = _mineField.length;
    var maxX = _mineField[y].length;
    var counter = 0;

    for (var y_ = max(y - 1, 0); y_ <= min(maxY - 1, y + 1); y_++) {
      var row = _mineField[y_].split('');
      for (var x_ = max(x - 1, 0); x_ <= min(maxX - 1, x + 1); x_++) {
        if (row[x_] == _mine) {
          counter++;
        }
      }
    }

    return (counter == 0) ? ' ' : counter.toString();
  }
}
