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

    test('returns the sum of numbers separated by a comma', () {
      expect(calculator.add('1,5'), equals(6));
    });

    test('handles newlines as separators', () {
      final calculator = StringCalculator();
      expect(calculator.add('1\n2,3'), equals(6));
    });

    test('supports custom delimiters defined at the beginning of the string', () {
      final calculator = StringCalculator();
      expect(calculator.add('//;\n1;2'), equals(3));
    });


  });
}
