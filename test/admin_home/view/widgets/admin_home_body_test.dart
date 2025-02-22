// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/admin_home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminHomeBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AdminHomeCubit(),
          child: MaterialApp(home: AdminHomeBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
