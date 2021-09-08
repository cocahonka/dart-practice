void main() {
  const arg = ['abc', 'abc abc'];
  print(wordValueSimply(arg));
  print(wordValueWithRegExp(arg));
  print(wordValueWithList(arg));
  print(wordValueWithMap(arg));
}

List<int> wordValueSimply(List<String> phrases) {
  // Наверное самый простой вариант для понимания новичку (кто знает основы основ)
  // т.е не знает многих фич языка...
  // Но это самый худший вариант решения, код плохо читается
  // и вообще так лучше не писать.
  // Возьмите за основу другие примеры
  const firstLetterCode = 97;
  const alphabetLength = 26;
  var values = <int>[];

  var map = <String, int>{
    for (var i = 1; i <= alphabetLength; ++i)
      String.fromCharCode(firstLetterCode + i - 1): i
  };

  for (var i = 0; i < phrases.length; ++i) {
    var phrase = phrases[i];
    var sum = 0;

    for (var j = 0; j < phrase.length; ++j) {
      var char = phrase[j];
      if (map.containsKey(char)) {
        sum += map[char]!;
      }
    }
    values.add((i + 1) * sum);
  }

  return values;
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
    var sum = phrase
        .toLowerCase()
        .split('')
        .fold<int>(0, (value, char) => value + (chars[char] ?? 0));

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
  var index = 0;
  return {for (var item in charsFromTo('a', 'z')) item: ++index};
}
