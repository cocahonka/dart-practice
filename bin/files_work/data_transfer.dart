import 'dart:convert';
import 'dart:io';

import 'package:pedantic/pedantic.dart' show unawaited;

abstract class A {
  Future<int> cum();
  void m(Function(int) ac);
}

class B extends A {
  @override
  Future<int> cum() async {
    // TODO: implement cum
    throw UnimplementedError();
  }

  @override
  void m(Function(int p1) ac) {
    // TODO: implement m
  }
}

Future<Null> someFunction() async {
  var file = File('/path/to/my/file');
  var now = DateTime.now();
  if ((await file.lastModified()).isBefore(now)) print('before'); // LINT
}

void main() async {
  final fileWorker = FileWorker('jump_from_the_cliff.txt', 'text.txt');
  var content = unawaited(fileWorker.getInputContent());
  // await Future.delayed(const Duration(seconds: 1));
  //content.forEach(print);
  // await fileWorker.transferData();

  // var contentSync = fileWorker.getInputContentSync();
  // contentSync.forEach((line) => print('sync :: $line'));

  // var content = await fileWorker.getInputContent();
  // content.forEach((line) => print(line));
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
    var access = await outputFile.open(mode: FileMode.write);
    inputFile
        .openRead()
        .transform(utf8.decoder)
        .listen((char) => access.writeString(char));
  }

  List<String> getInputContentSync() {
    var content = <String>[];
    var access = inputFile.openSync(mode: FileMode.read);
    var length = access.lengthSync();

    var bytes = access.readSync(length);
    content.addAll(utf8.decode(bytes).split('\n'));

    return content;
  }

  Future<List<String>> getInputContent() => inputFile.readAsLines();
}
