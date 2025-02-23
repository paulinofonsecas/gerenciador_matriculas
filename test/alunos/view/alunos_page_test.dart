// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/alunos/alunos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AlunosPage', () {
    group('route', () {
      test('is routable', () {
        expect(AlunosPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AlunosView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AlunosPage()));
      expect(find.byType(AlunosView), findsOneWidget);
    });
  });
}
