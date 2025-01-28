class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<String> delimiters = [',', '\n']; // Default delimiters
    String numberString = numbers;

    // Check for custom delimiters
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiterPart = parts[0].substring(2); // Extract part after '//'

      // Handle multiple delimiters
      final delimiterRegex = RegExp(r'\[(.*?)\]');
      final matches = delimiterRegex.allMatches(delimiterPart);

      if (matches.isNotEmpty) {
        delimiters
            .addAll(matches.map((match) => RegExp.escape(match.group(1)!)));
      } else {
        delimiters.add(RegExp.escape(delimiterPart)); // Single delimiter
      }

      numberString = parts.sublist(1).join('\n'); // Remaining numbers
    }

    // Create a regex for splitting numbers by all delimiters
    final splitPattern = RegExp(delimiters.join('|'));
    final numParts = numberString.split(splitPattern);
    final nums = numParts.map(int.parse).toList();

    // Check for negatives
    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('Negative numbers not allowed: ${negatives.join(',')}');
    }

    // Ignore numbers greater than 1000
    final validNumbers = nums.where((n) => n <= 1000).toList();

    return validNumbers.isEmpty ? 0 : validNumbers.reduce((a, b) => a + b);
  }
}
