import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_login/view/admin_login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Matrículas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: AdminLoginPage(),
    );
  }
}
