import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/app_widget.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (context) => AuthFirebase(), //
      child: const MyApp(),
    ),
  );
}
