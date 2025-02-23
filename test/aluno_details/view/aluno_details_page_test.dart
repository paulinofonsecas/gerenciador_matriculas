// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/aluno_details/aluno_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AlunoDetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(AlunoDetailsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AlunoDetailsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AlunoDetailsPage()));
      expect(find.byType(AlunoDetailsView), findsOneWidget);
    });
  });
}
