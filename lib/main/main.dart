import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './factories/factories.dart';
import '../ui/components/components.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: makeSplashPage,
          transition: Transition.fade,
        ),
        GetPage(
          name: '/login',
          page: makeLoginPage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/surveys',
          page: makeSurveysPage,
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
