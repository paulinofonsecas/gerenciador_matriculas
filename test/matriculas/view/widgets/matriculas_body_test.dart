// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/matriculas/matriculas.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MatriculasBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => MatriculasCubit(),
          child: MaterialApp(home: MatriculasBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
