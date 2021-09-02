import 'dart:convert';
import 'dart:io';

String input([String? message]) {
  if (message != null) stdout.write(message);
  return stdin.readLineSync(encoding: Encoding.getByName('utf-8')!) ?? '';
}
