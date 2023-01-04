import 'package:test/test.dart';

import 'package:ForDev/domain/helpers/helpers.dart';

import 'package:ForDev/validation/validators/validators.dart';

void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if value is not empty', () {
    expect(sut.validate('any_value'), null);
  });

  test('Should return error if value is empty', () {
    expect(sut.validate(''), FieldError.requiredField.description);
  });

  test('Should return error if value is null', () {
    expect(sut.validate(null), FieldError.requiredField.description);
  });
}