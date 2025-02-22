// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/client_login/client_login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClientLoginBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ClientLoginCubit(),
          child: MaterialApp(home: ClientLoginBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
