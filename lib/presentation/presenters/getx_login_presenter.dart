//import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../ui/pages/pages.dart';
import '../../ui/helpers/errors/errors.dart';

//import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../protocols/protocols.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Authentication authentication;
  final Validation validation;
  final SaveCurrentAccount saveCurrentAccount;

  final _emailError = Rx<UIError>();
  final _passwordError = Rx<UIError>();
  final _mainError = Rx<UIError>();
  final _navigateTo = RxString();
  final _isFormValid = false.obs;
  final _isLoading = false.obs;

  String _email;
  String _password;

  Stream<UIError> get emailErrorStream => _emailError.stream;
  Stream<UIError> get passwordErrorStream => _passwordError.stream;
  Stream<UIError> get mainErrorStream => _mainError.stream;
  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxLoginPresenter({
    @required this.authentication,
    @required this.validation,
    @required this.saveCurrentAccount,
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField('password');
    _validateForm();
  }

  UIError _validateField(String field) {
    final formData = {
      'email': _email,
      'password': _password,
    };
    final error = validation.validate(field: field, input: formData);

    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
        break;
      case ValidationError.requiredField:
        return UIError.requiredField;
      default:
        return null;
        break;
    }
  }

  void _validateForm() {
    _isFormValid.value = _emailError.value == null &&
        _passwordError.value == null &&
        _email != null &&
        _password != null;
  }

  Future<void> auth() async {
    try {
      _isLoading.value = true;

      final account = await authentication
          .auth(AuthenticationParams(email: _email, secret: _password));
      await saveCurrentAccount.save(account);
      _navigateTo.value = '/surveys';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          _mainError.value = UIError.invalidCredentials;
          break;
        default:
          _mainError.value = UIError.unexpected;
      }

      _isLoading.value = false;
    }
  }

  void gotoSignUp() {
    _navigateTo.value = '/signup';
  }

  void dispose() {}
}
