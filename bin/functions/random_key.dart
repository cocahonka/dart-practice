import 'dart:convert';
import 'dart:math';

void main() {}

String generateKey([int length = 32]) {
  var result = StringBuffer();
  var random = Random.secure();

  var whiteList = [
    ...fromTo('a', 'z'),
    ...fromTo('A', 'Z'),
    ...fromTo('а', 'я'),
    ...fromTo('А', 'Я')
  ];

  for (var i = 0; i < length; ++i) {
    var index = random.nextInt(whiteList.length);
    result.write(whiteList[index]);
  }

  return result.toString();
}

String generateKeyUrl([int length = 32]) {
  var random = Random.secure();
  var values = List<int>.generate(length, (_) => random.nextInt(256));
  return base64Encode(values);
}

Iterable<String> fromTo(String start, String end) sync* {
  if (start.length > 1 || end.length > 1) {
    throw ArgumentError('Input strings must be length 1');
  }

  var startCode = start.codeUnitAt(0);
  var endCode = end.codeUnitAt(0);

  if (startCode > endCode) {
    throw ArgumentError('Start string is greater than end string');
  }

  for (var i = startCode; i < endCode; ++i) {
    yield String.fromCharCode(i);
  }
}
