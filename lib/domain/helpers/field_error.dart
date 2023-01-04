enum FieldError {
  requiredField,
  invalidField,
}

extension FieldErrorExtension on FieldError {
  String get description {
    switch (this) {
      case FieldError.requiredField:
        return 'Campo obrigatório';
      case FieldError.invalidField:
        return 'Compo inválido';
      default:
        return '';
    }
  }
}
