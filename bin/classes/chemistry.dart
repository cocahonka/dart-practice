import 'dart:convert';
import 'dart:io';
import 'dart:math';

class ConsoleRiddle<K, V> {
  Map<K, V> _table;

  final _random = Random.secure();

  ConsoleRiddle(this._table);

  QABundle generateRandomRiddle() {
    var entries = _table.entries.toList();
    var index = _random.nextInt(entries.length);
    var entry = entries[index];
    var bundle = [entry.key, entry.value]..shuffle();
    return QABundle(
        question: bundle.first.toString(), answer: bundle.last.toString());
  }
}

class QABundle<Q> {
  final Q question;
  final String answer;
  const QABundle({required this.question, required this.answer});
}

void main() {
  final riddle = ConsoleRiddle({
    'мет': 1,
    'эт': 2,
    'проп': 3,
    'бут': 4,
    'пент': 5,
    'гекс': 6,
    'гепт': 7,
    'окт': 8,
    'нон': 9,
    'дек': 10
  });

  while (true) {
    var bundle = riddle.generateRandomRiddle();
    stdout.write('\n${bundle.question} :: ');
    var answer = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!)!;
    if (answer == bundle.answer) {
      stdout.write('верно');
    } else {
      stdout.write('ошибка!, верно будет ${bundle.answer}');
    }
    stdout.write('\n');
  }
}
