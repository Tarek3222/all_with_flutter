import 'package:all_with_flutter/extensions/string_extensions.dart';

class AppValidators {
  static String? validateEmail(String? val) {
    if (val.isNullOrEmpty()) {
      return "Please enter an email";
    } else if (!val.isValidEmail) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password.isNullOrEmpty()) {
      return "Please enter a password";
    } else if (!password.isValidPassword) {
      return "Password must contain at least:\n-one uppercase letter\n-one lowercase letter\n-one number\n-one special character";
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber.isNullOrEmpty()) {
      return "Please enter a phone number";
    } else if (!phoneNumber.isValidPhone) {
      return "Please enter a valid phone number";
    } else {
      return null;
    }
  }

  static bool isNationalIdValid(String id) {
    // Step 1: Basic format check
    final regex = RegExp(r'^[23]\d{13}$');
    if (!regex.hasMatch(id)) return false;

    // Step 2: Extract century, date parts
    int century = int.parse(id[0]) == 2 ? 1900 : 2000;
    int year = int.parse(id.substring(1, 3));
    int month = int.parse(id.substring(3, 5));
    int day = int.parse(id.substring(5, 7));

    // Step 3: Check valid date
    try {
      DateTime date = DateTime(century + year, month, day);
      if (date.year != (century + year) ||
          date.month != month ||
          date.day != day) {
        return false;
      }
      if (date.isAfter(DateTime.now())) return false;
    } catch (_) {
      return false;
    }

    // Step 4: Check valid governorate code
    final validGovernorateCodes = {
      '01',
      '02',
      '03',
      '04',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '31',
      '32',
      '33',
      '34',
      '35',
      '88',
    };
    String govCode = id.substring(7, 9);
    if (!validGovernorateCodes.contains(govCode)) return false;

    return true;
  }
}
