enum FieldError { requiredField }

extension FieldErrorExtension on FieldError {
  String get description {
    switch (this) {
      case FieldError.requiredField:
        return 'Campo obrigatório';
      default:
        return '';
    }
  }
}
