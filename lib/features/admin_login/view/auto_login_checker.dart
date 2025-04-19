import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/view/admin_home_page.dart';
import 'package:gerenciador_matriculas/features/aluno_home/view/aluno_home_page.dart';
import 'package:gerenciador_matriculas/features/client_login/view/client_login_page.dart';
import 'package:gerenciador_matriculas/features/admin_login/view/admin_login_page.dart';
import 'package:gerenciador_matriculas/data/services/login_cache.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/dependencies.dart';

class AutoLoginChecker extends StatefulWidget {
  const AutoLoginChecker({Key? key}) : super(key: key);

  @override
  State<AutoLoginChecker> createState() => _AutoLoginCheckerState();
}

class _AutoLoginCheckerState extends State<AutoLoginChecker> {
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _tryAutoLogin();
  }

  Future<void> _tryAutoLogin() async {
    final login = await LoginCache.getLogin();
    if (login == null) {
      _goToLogin();
      return;
    }
    try {
      final auth = AuthFirebase();
      User? user;
      if (login['isAluno'] == 'true') {
        user = await auth.loginAluno(login['matricula']!, login['password']!);
        Navigator.of(context).pushReplacement(AlunoHomePage.route());
      } else {
        user = await auth.login(login['email']!, login['password']!);
        Navigator.of(context).pushReplacement(AdminHomePage.route());
      }
      getIt.registerSingleton<User>(user);
    } catch (e) {
      await LoginCache.clear();
      _goToLogin();
    }
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacement(ClientLoginPage.route());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
