import 'package:meta/meta.dart';

enum ValidationError {
  requiredField,
  invalidField,
}

abstract class Validation {
  ValidationError validate({@required String field, @required Map input});
}
