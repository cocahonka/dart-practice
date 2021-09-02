class Luhn {
  bool valid(String card) {
    var clean = card.replaceAll(RegExp(r'/s'), '');
    if (clean.length <= 1 || clean.contains(RegExp(r'\D'))) {
      return false;
    }

    var sum = 0;
    clean
        .split('')
        .reversed
        .map(int.parse)
        .toList()
        .asMap()
        .forEach((index, value) {
      sum += (index.isEven) ? value : value * 2;
    });

    return sum % 10 == 0;
  }
}
