// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_login/admin_login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminLoginBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AdminLoginCubit(),
          child: MaterialApp(home: AdminLoginBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
