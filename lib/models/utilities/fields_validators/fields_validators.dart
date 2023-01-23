import 'fields_validators_manager.dart';

class FieldsValidators extends FieldsValidatorsManager {
  static final FieldsValidators instance = FieldsValidators._internal();

  factory FieldsValidators() {
    return instance;
  }

  FieldsValidators._internal();

  @override
  bool validateEmail(String email) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!(regex.hasMatch(email))) {
      return false;
    }
    return true;
  }
}
