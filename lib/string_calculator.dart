class StringCalculator{
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numberString = numbers;

    // Check for custom delimiter
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2); // Extract the delimiter after "//"
      numberString = parts.sublist(1).join('\n'); // Remaining numbers
    }

    // Replace newlines with the delimiter and split
    final numParts = numberString.replaceAll('\n', delimiter).split(delimiter);
    final nums = numParts.map(int.parse).toList();

    // Check for negative numbers
    final negatives = nums.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('Negative numbers not allowed: ${negatives.join(',')}');
    }

    // Ignore numbers greater than 1000
    final validNumbers = nums.where((n) => n <= 1000).toList();

    return validNumbers.reduce((a, b) => a + b);
  }
}