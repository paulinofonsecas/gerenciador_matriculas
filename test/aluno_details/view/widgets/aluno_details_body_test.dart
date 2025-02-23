// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/aluno_details/aluno_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AlunoDetailsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AlunoDetailsCubit(),
          child: MaterialApp(home: AlunoDetailsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
