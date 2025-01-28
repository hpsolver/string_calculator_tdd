class StringCalculator{
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    final parts = numbers.replaceAll('\n', ',').split(',');
    final nums = parts.map(int.parse).toList();
    final negatives = nums.where((n) => n < 0);
    if (negatives.isNotEmpty) {
      throw Exception('Negative numbers not allowed: ${negatives.join(',')}');
    }
    return nums.reduce((a, b) => a + b);
  }
}