// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/add_aluno/add_aluno.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddAlunoBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddAlunoCubit(),
          child: MaterialApp(home: AddAlunoBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
