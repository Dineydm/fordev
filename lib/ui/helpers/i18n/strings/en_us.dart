import './translations.dart';

class EnUs implements Translations {
  String get msgRequiredField => 'Required field';
  String get msgInvalidField => 'Invalid field';
  String get msgInvalidCredentials => 'Invalid credentials.';
  String get msgDefaultError => 'Something wrong happened. Try again soon.';

  String get addAccount => 'Add account';
  String get email => 'Email';
  String get enter => 'Enter';
  String get login => 'Login';
  String get password => 'Password';
}
