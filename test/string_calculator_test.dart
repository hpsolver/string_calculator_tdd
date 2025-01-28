import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main() {
  group('StringCalculator - Add Method', () {
    final calculator = StringCalculator();

    test('returns 0 for an empty string', () {
      expect(calculator.add(''), equals(0));
    });

    test('returns the number itself for a single number', () {
      expect(calculator.add('5'), equals(5));
    });

  });
}
