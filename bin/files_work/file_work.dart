import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  final myFile = File('assets/text.txt');
  var content = [
    'Пятнадцать человек на сундук мертвеца.\n',
    'Йо-хо-хо, и бутылка рому!\n',
    'Пей, и дьявол тебя доведет до конца.\n',
    'Йо-хо-хо, и бутылка рому!'
  ];
  content.forEach((element) {
    myFile.writeAsStringSync(element, mode: FileMode.writeOnlyAppend);
  });

  Stream<String> lines =
      myFile.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      print('$line: ${line.length}');
    }
    print('End.');
  } catch (e) {
    print('Error: $e');
  }
}
