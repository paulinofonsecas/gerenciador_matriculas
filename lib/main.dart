import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/app_widget.dart';
import 'package:gerenciador_matriculas/features/admin_login/view/auto_login_checker.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';
import 'package:gerenciador_matriculas/dependencies.dart';
import 'package:gerenciador_matriculas/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupDependencies();

  runApp(
    Provider(
      create: (context) => AuthFirebase(), //
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AutoLoginChecker(),
      ),
    ),
  );
}
