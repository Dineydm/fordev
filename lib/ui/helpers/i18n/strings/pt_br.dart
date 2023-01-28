import './translations.dart';

class PtBr implements Translations {
  String get msgDefaultError =>
      'Algo errado aconteceu. Tente novamente em breve.';
  String get msgEmailInUse => 'O e-mail já está em uso.';
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  String get msgInvalidField => 'Campo inválido';
  String get msgRequiredField => 'Campo obrigatório';

  String get addAccount => 'Criar conta';
  String get confirmPassword => 'Confirmar senha';
  String get email => 'E-mail';
  String get enter => 'Entrar';
  String get login => 'Login';
  String get name => 'Nome';
  String get password => 'Senha';
  String get surveys => 'Enquetes';
  String get wait => 'Aguarde...';
}
