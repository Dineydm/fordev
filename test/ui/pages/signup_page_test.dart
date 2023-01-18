import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:ForDev/ui/helpers/helpers.dart';
import 'package:ForDev/ui/pages/pages.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    final signUpPage = GetMaterialApp(
      initialRoute: '/signup',
      getPages: [
        GetPage(name: '/signup', page: () => SignUpPage()),
      ],
    );
    await tester.pumpWidget(signUpPage);
  }

  testWidgets('Should load with correct inital state',
      (WidgetTester tester) async {
    await loadPage(tester);

    final nameTextChildren = find.descendant(
        of: find.bySemanticsLabel(R.strings.name), matching: find.byType(Text));
    expect(
      nameTextChildren,
      findsOneWidget,
      reason: 'When a TextFormField has only one text child, means it has no '
          'errors, since one of the childs is always the label text.',
    );

    final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel(R.strings.email),
        matching: find.byType(Text));
    expect(
      emailTextChildren,
      findsOneWidget,
      reason: 'When a TextFormField has only one text child, means it has no '
          'errors, since one of the childs is always the label text.',
    );

    final passwordTextChildren = find.descendant(
        of: find.bySemanticsLabel(R.strings.password),
        matching: find.byType(Text));
    expect(
      passwordTextChildren,
      findsOneWidget,
      reason: 'When a TextFormField has only one text child, means it has no '
          'errors, since one of the childs is always the label text.',
    );

    final passwordConfirmationTextChildren = find.descendant(
        of: find.bySemanticsLabel(R.strings.confirmPassword),
        matching: find.byType(Text));
    expect(
      passwordConfirmationTextChildren,
      findsOneWidget,
      reason: 'When a TextFormField has only one text child, means it has no '
          'errors, since one of the childs is always the label text.',
    );

    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.onPressed, null);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
