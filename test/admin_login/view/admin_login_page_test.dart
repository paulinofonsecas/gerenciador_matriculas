// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_login/admin_login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminLoginPage', () {
    group('route', () {
      test('is routable', () {
        expect(AdminLoginPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AdminLoginView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AdminLoginPage()));
      expect(find.byType(AdminLoginView), findsOneWidget);
    });
  });
}
