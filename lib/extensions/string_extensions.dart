// String Extensions
extension StringExtensions on String? {
  /// Check if the string is null or empty
  bool isNullOrEmpty() => this == null || this == "";

  /// Check if the string is null, empty, or contains only whitespace
  bool isNullOrBlank() => this == null || this!.trim().isEmpty;

  /// Capitalize the first letter of a string
  String? capitalize() {
    if (isNullOrEmpty()) return this;
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  /// Remove all whitespace characters (spaces, tabs, newlines)
  String? removeWhitespace() {
    if (isNullOrEmpty()) return this;
    return this!.replaceAll(RegExp(r'\s+'), '');
  }

  /// Remove extra whitespace (trim and replace multiple spaces with single space)
  String? removeExtraSpaces() {
    if (isNullOrEmpty()) return this;
    return this!.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Capitalize the first letter of each word in a string
  String? capitalizeEachWord() {
    if (this == null || this!.isEmpty) return this;
    return this!
        .split(' ')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : word,
        )
        .join(' ');
  }

  /// Extract numbers from a string
  String? extractNumbers() {
    if (isNullOrEmpty()) return this;
    return this!.replaceAll(RegExp(r'[^0-9]'), '');
  }

  //==================Validation==================//
  bool get isValidEmail {
    if (isNullOrEmpty()) return false;
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this!);
  }

  /// Check if string is a valid phone number (basic validation)
  bool get isValidPhone {
    if (isNullOrEmpty()) return false;
    return RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(this!);
  }

  bool get isValidPassword {
    if (isNullOrEmpty()) return false;
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    ).hasMatch(this!);
  }

  /// Check if string is a valid URL
  bool get isValidUrl {
    if (isNullOrEmpty()) return false;
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$',
    ).hasMatch(this!);
  }

  /// Check if string contains only numbers
  bool get isNumeric {
    if (isNullOrEmpty()) return false;
    return RegExp(r'^[0-9]+$').hasMatch(this!);
  }

  /// Check if the string is an integer
  bool get isInt {
    if (isNullOrEmpty()) return false;
    return int.tryParse(this!) != null;
  }

  /// Check if the string is a double
  bool get isDouble {
    if (isNullOrEmpty()) return false;
    final value = double.tryParse(this!);
    return value != null && this!.contains(RegExp(r'[\.eE]'));
  }

  // ========== String Manipulation ==========

  /// Reverse the string
  String? reverse() {
    if (isNullOrEmpty()) return this;
    return this!.split('').reversed.join();
  }

  /// Check if the string is a palindrome
  bool get isPalindrome {
    if (isNullOrEmpty()) return false;
    final clean = this!.toLowerCase().removeWhitespace();
    return clean == clean!.split('').reversed.join();
  }

  /// Remove special characters, keep only letters, numbers, and spaces
  String? removeSpecialChars() {
    if (isNullOrEmpty()) return this;
    return this!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  }

  //==================Parsing==================//

  /// Parse string to int with default value
  int toIntOrDefault([int defaultValue = 0]) {
    if (isNullOrEmpty()) return defaultValue;
    return int.tryParse(this!) ?? defaultValue;
  }

  /// Parse string to double with default value
  double toDoubleOrDefault([double defaultValue = 0.0]) {
    if (isNullOrEmpty()) return defaultValue;
    return double.tryParse(this!) ?? defaultValue;
  }

  /// Convert to bool from common string patterns ("true", "false", "1", "0", "yes", "no")
  bool? toBoolOrNull() {
    if (isNullOrEmpty()) return null;
    final lower = this!.toLowerCase().trim();
    if (['true', '1', 'yes', 'y'].contains(lower)) return true;
    if (['false', '0', 'no', 'n'].contains(lower)) return false;
    return null;
  }

  /// Convert to num (int or double) or return 0 if invalid
  num toNumOrZero() {
    return num.tryParse(this ?? '') ?? 0;
  }
}
