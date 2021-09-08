void main() {
  const arg = ['abc', 'abc abc'];
  print(wordValueWithRegExp(arg));
  print(wordValueWithList(arg));
  print(wordValueWithMap(arg));
}

List<int> wordValueWithRegExp(List<String> phrases) {
  const firstLetterCode = 97;
  var values = <int>[];

  phrases.asMap().forEach((index, phrase) {
    var requiredLetters = RegExp(r'[a-z]').allMatches(phrase.toLowerCase());
    var letters = requiredLetters.map((match) => match.group(0)!);
    var sum = letters.fold<int>(0,
        (value, letter) => value + letter.codeUnitAt(0) - firstLetterCode + 1);

    values.add(sum * ++index);
  });

  return values;
}

List<int> wordValueWithMap(List<String> phrases) {
  var chars = charsFromToAsMap('a', 'z');
  var values = <int>[];

  phrases.asMap().forEach((index, phrase) {
    var sum = 0;

    for (var i = 0; i < phrase.length; ++i) {
      var char = phrase[i];
      sum += chars[char] ?? 0;
    }

    values.add(sum * ++index);
  });

  return values;
}

List<int> wordValueWithList(List<String> phrases) {
  var chars = charsFromTo('a', 'z').toList();
  var values = <int>[];

  phrases.asMap().forEach((index, phrase) {
    var sum = 0;

    phrase.toLowerCase().split('').forEach((char) {
      if (chars.contains(char)) {
        sum += chars.indexOf(char) + 1;
      }
    });

    values.add(sum * ++index);
  });

  return values;
}

Iterable<String> charsFromTo(String start, String end) sync* {
  var startCode = start.codeUnitAt(0);
  var endCode = end.codeUnitAt(0);

  for (var code = startCode; code <= endCode; ++code) {
    yield String.fromCharCode(code);
  }
}

Map<String, int> charsFromToAsMap(String start, String end) {
  var result = <String, int>{};

  var startCode = start.codeUnitAt(0);
  var endCode = end.codeUnitAt(0);

  var i = 1;
  for (var code = startCode; code <= endCode; ++code) {
    result[String.fromCharCode(code)] = i++;
  }

  return result;
}
