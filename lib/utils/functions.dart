class Functions {
  static String convertDecimalToBinary(String decimal) {
    return decimal.isNotEmpty ? int.parse(decimal).toRadixString(2) : '';
  }

  static String convertBinaryToDecimal(String binary) {
    var result = int.tryParse(binary, radix: 2);
    return result != null ? result.toString() : '';
  }
}
