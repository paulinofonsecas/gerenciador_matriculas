// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/alunos/alunos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AlunosBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AlunosCubit(),
          child: MaterialApp(home: AlunosBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
