import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() => startServer();

void useFuture1() {
  print('before future');
  fetchUser(5, mode: WorkMode.normal)
      .then((value) {
        print(value);
        var encoder = const JsonEncoder.withIndent('  ');
        var jsonString = encoder.convert(value);
        return 'data :: $jsonString';
      })
      .then(print)
      .catchError(print);
  print('after future');
  // before future
  // after future
  // result..
}

void useFuture2() async {
  print('before future');
  try {
    // var result = await fetchUser(8, mode: WorkMode.normal); // not block UI
    var result = await fetchUserTrue(Random.secure().nextInt(10));
    print(result);
  } catch (e) {
    print(e);
  }
  print('after future');
  // before future
  // result..
  // after future
}

enum WorkMode { normal, error }

// Future - value or error
Future<Map<String, String>> fetchUser(int userId, {required WorkMode mode}) {
  return Future.delayed(
      const Duration(seconds: 1),
      () => (mode == WorkMode.normal)
          ? {'id': userId.toString(), 'name': 'Ivan'}
          : throw Exception('big boom.'));
}

Future<Map<String, String>> fetchUserTrue(int userId) async {
  var uri = Uri.parse('https://jsonplaceholder.typicode.com/users/$userId');
  var response = await http.get(uri);
  var json = jsonDecode(response.body) as Map;
  return {'id': json['id'].toString(), 'name': json['name']};
}

Stream<int> streamOfInts() async* {
  var random = Random.secure();
  for (var i = 0; i < 5; ++i) {
    var randomNumber = random.nextInt(3000);
    yield await Future.delayed(
        Duration(milliseconds: randomNumber), () => randomNumber);
  }
}

void useStream1() async {
  var stream = streamOfInts().where((number) => number < 2000).take(2);
  await for (var number in stream) {
    print(number);
  }
}

void useStream2() async {
  streamOfInts().skip(2).listen((number) {
    print(number);
  });
}

void readFile1() async {
  var content = File('./assets/text.txt').openRead();
  var stream = content.transform(utf8.decoder).transform(const LineSplitter());
  await for (var line in stream) {
    print(line);
  }
}

void readFile2() async {
  var content = File('./assets/text.txt').openRead();
  var lines = await content
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .toList();
  print(lines);
}

void readFile3() async {
  var content = File('./assets/text.txt').openRead();
  var lines = await transformedFileContent(
          content.transform(utf8.decoder).transform(const LineSplitter()))
      .toList();
  print(lines);
}

Stream<String> transformedFileContent(Stream<String> stream) async* {
  await for (var line in stream) {
    yield 'line :: $line';
  }
}

void startServer() async {
  var server = await HttpServer.bind('localhost', 4444);
  server.listen((request) {
    request.response.write('Hello from dart ;)');
    request.response.close();
  });
}
