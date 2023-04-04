class Functions {
  // Convert to binary
  static String convertDecimalToBinary(String sequence) {
    var result = _getResult(sequence, 2);
    return result;
  }

  static String convertHexadecimalToBinary(String sequence) {
    var decimalSequence = convertHexadecimalToDecimal(sequence);
    var result = convertDecimalToBinary(decimalSequence);
    return result;
  }

  // Convert to decimal
  static String convertBinaryToDecimal(String sequence) {
    var result = _getResultExplicitRadix(sequence, 2);
    return result;
  }

  static String convertHexadecimalToDecimal(String sequence) {
    var result = _getResultExplicitRadix(sequence, 16);
    return result;
  }

  // Convert to hexadecimal
  static String convertDecimalToHexadecimal(String sequence) {
    var result = _getResult(sequence, 16);
    return result;
  }

  static String convertBinaryToHexadecimal(String sequence) {
    var decimalSequence = convertBinaryToDecimal(sequence);
    var result = convertDecimalToHexadecimal(decimalSequence);
    return result;
  }

  // Utils
  static _getResult(String numberText, int radix) {
    try {
      var result = int.tryParse(numberText)?.toRadixString(radix).toUpperCase();
      return result ?? '';
    } catch (e) {
      return '';
    }
  }

  static _getResultExplicitRadix(String sequence, int radix) {
    try {
      var result = int.tryParse(sequence, radix: radix);
      return result != null ? result.toString() : '';
    } catch (e) {
      return '';
    }
  }
}
