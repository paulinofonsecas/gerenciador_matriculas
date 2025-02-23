// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/add_aluno/add_aluno.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddAlunoPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddAlunoPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddAlunoView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddAlunoPage()));
      expect(find.byType(AddAlunoView), findsOneWidget);
    });
  });
}
