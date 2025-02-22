// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/client_login/client_login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClientLoginPage', () {
    group('route', () {
      test('is routable', () {
        expect(ClientLoginPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ClientLoginView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ClientLoginPage()));
      expect(find.byType(ClientLoginView), findsOneWidget);
    });
  });
}
