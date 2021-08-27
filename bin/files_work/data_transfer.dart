import 'dart:convert';
import 'dart:io';

void main() async {
  final fileWorker = FileWorker('jump_from_the_cliff.txt', 'text.txt');
  await fileWorker.transferData();
  // fileWorker.getInputContentSync().forEach(print);
  // fileWorker.getInputContent().then((value) => value.forEach(print));
}

class FileWorker {
  static const String dir = 'assets/';
  final File inputFile;
  final File outputFile;

  FileWorker(String inputFileName, String outputFileName)
      : inputFile = File('$dir$inputFileName'),
        outputFile = File('$dir$outputFileName');

  void transferDataSync() {
    // var inputAccess = inputFile.openSync(mode: FileMode.read);
    // var length = inputFile.lengthSync();
    // var bytes = inputAccess.readSync(length);

    // var outputAccess = outputFile.openSync(mode: FileMode.write);
    // outputAccess.writeFromSync(bytes);

    var inputContent = inputFile.readAsStringSync();
    outputFile.writeAsStringSync(inputContent);
  }

  Future<void> transferData() async {
    var buffer = StringBuffer();
    var chars = inputFile.openRead().transform(utf8.decoder);
    await for (var char in chars) {
      buffer.write(char);
    }
    await outputFile.writeAsString(buffer.toString());
  }

  List<String> getInputContentSync() => inputFile.readAsLinesSync();

  Future<List<String>> getInputContent() => inputFile.readAsLines();
}
