import 'dart:async';

Future<void> main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
  var numericStream = Stream<int>.fromIterable([5, 7, -3, 5, 0, -9, -8]);
  print(await lastPositive(numericStream));
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (var i = 1; i <= to; ++i) {
    yield i;
  }
}

Future<int> lastPositive(Stream<int> stream) =>
    stream.lastWhere((x) => !x.isNegative);
