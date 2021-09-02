import 'package:test/test.dart';
import '../classes/luhn.dart';

void main() {
  final valid = Luhn().valid;
  group('Incorrect card string', () {
    test('Card with length 1 is not valid', () {
      var card = '5';
      expect(valid(card), false);
    });
    test('Invalid characters in card are not valid', () {
      var card = '5894 6513 4354 8y13';
      expect(valid(card), false);
    });
  });
  group('Correct card string, but not valid', () {
    test('Incorrect card number', () {
      var card = '8273 1232 7352 0569';
      expect(valid(card), false);
    });
  });
  group('Correct card', () {
    test('Correct card number', () {
      var card = '4539 3195 0343 6467';
      expect(valid(card), true);
    });
  });
}
