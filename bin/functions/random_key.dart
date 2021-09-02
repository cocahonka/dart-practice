import 'dart:convert';
import 'dart:math';

void main() {
  var randomUtils = RandomUtils();
  print(randomUtils.generateKeyUrl());
  print(randomUtils.generateKeyWithWhiteList());
}

class RandomUtils {
  static final _random = Random.secure();

  String generateKeyUrl([int length = 32]) {
    // base64 encode requires 8-bit char,
    // so numeric limit is [0, 0xFF] => [0, 0x100).
    var bytes = List.generate(length, (_) => _random.nextInt(0x100));
    return base64UrlEncode(bytes);
  }

  String generateKeyWithWhiteList([int length = 32]) {
    var result = StringBuffer();
    var whiteList = [
      ..._fromTo('а', 'я'),
      ..._fromTo('А', 'Я'),
      ..._fromTo('1', '9'),
      '_',
      '.'
    ];

    for (var i = 0; i < length; ++i) {
      var index = _random.nextInt(whiteList.length);
      result.write(whiteList[index]);
    }

    return result.toString();
  }

  Iterable<String> _fromTo(String start, String end) sync* {
    if (start.length > 1 || end.length > 1) {
      throw ArgumentError('Strings must be length 1 [String must be char]');
    }

    var startCode = start.codeUnitAt(0);
    var endCode = end.codeUnitAt(0);

    if (startCode > endCode) {
      throw ArgumentError(
          'End string [char] must be greater than start string [char]');
    }

    for (var i = startCode; i < endCode; ++i) {
      yield String.fromCharCode(i);
    }
  }
}
