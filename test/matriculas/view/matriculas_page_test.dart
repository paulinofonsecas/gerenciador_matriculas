// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/matriculas/matriculas.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MatriculasPage', () {
    group('route', () {
      test('is routable', () {
        expect(MatriculasPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MatriculasView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MatriculasPage()));
      expect(find.byType(MatriculasView), findsOneWidget);
    });
  });
}
