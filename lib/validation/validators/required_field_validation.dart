import '../../domain/helpers/field_error.dart';
import '../protocols/protocols.dart';

class RequiredFieldValidation implements FieldValidation {
  final String field;

  RequiredFieldValidation(this.field);

  String validate(String value) {
    return value?.isNotEmpty == true
        ? null
        : FieldError.requiredField.description;
  }
}
