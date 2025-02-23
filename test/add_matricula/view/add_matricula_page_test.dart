// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/add_matricula/add_matricula.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddMatriculaPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddMatriculaPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddMatriculaView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddMatriculaPage()));
      expect(find.byType(AddMatriculaView), findsOneWidget);
    });
  });
}
