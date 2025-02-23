// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/add_matricula/add_matricula.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddMatriculaBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddMatriculaCubit(),
          child: MaterialApp(home: AddMatriculaBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
