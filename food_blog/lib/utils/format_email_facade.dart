import 'package:regexed_validator/regexed_validator.dart';

class FormatEmailFacade {
  static String getSortEmail(String? email) {
    if (email != null && validator.email(email) == true) {
      return '@${email.substring(0, email.indexOf('@'))}';
    }
    return '-';
  }
}