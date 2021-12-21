import 'package:email_validator/email_validator.dart';

class Utils {
  static bool isEmail(String? value) {
    if (value != null) {
      //validating if value is an email address
      return EmailValidator.validate(value); 
    } else {
      return false;
    }
  }
}
