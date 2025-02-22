// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/admin_home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminHomePage', () {
    group('route', () {
      test('is routable', () {
        expect(AdminHomePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AdminHomeView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AdminHomePage()));
      expect(find.byType(AdminHomeView), findsOneWidget);
    });
  });
}
