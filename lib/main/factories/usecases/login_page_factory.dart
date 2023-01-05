import 'package:ForDev/data/usecases/remote_authentication.dart';
import 'package:ForDev/infra/http/http_adapter.dart';
import 'package:ForDev/presentation/presenters/stream_login_presenter.dart';
import 'package:ForDev/validation/validators/validators.dart';
import 'package:flutter/material.dart';

import 'package:ForDev/ui/pages/pages.dart';
import 'package:http/http.dart';

Widget makeLoginPage() {
  final url = 'http://fordevs.herokuapp.com/api/login';
  final client = Client();
  final httpAdapter = HttpAdapter(client);
  final remoteAuthentication = RemoteAuthentication(
    httpClient: httpAdapter,
    url: url,
  );
  final validationComposite = ValidationComposite([
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password'),
  ]);
  final streamLoginPresenter = StreamLoginPresenter(
    authentication: remoteAuthentication,
    validation: validationComposite,
  );

  return LoginPage(streamLoginPresenter);
}
