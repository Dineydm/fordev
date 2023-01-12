import './translations.dart';

class PtBr implements Translations {
  String get msgRequiredField => 'Campo obrigatório';
  String get msgInvalidField => 'Campo inválido';
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  String get msgDefaultError =>
      'Algo errado aconteceu. Tente novamente em breve.';

  String get addAccount => 'Criar conta';
  String get email => 'E-mail';
  String get enter => 'Entrar';
  String get login => 'Login';
  String get password => 'Senha';
}