import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/dependencies.dart';
import 'package:gerenciador_matriculas/features/admin_login/view/admin_login_page.dart';
import 'package:gerenciador_matriculas/features/alunos/view/alunos_page.dart';
import 'package:gerenciador_matriculas/features/admin_home/view/reclamacoes_admin_page.dart';
import 'package:gerenciador_matriculas/features/relatorios/relatorios_admin_page.dart';

class AdminHomeDrawer extends StatelessWidget {
  const AdminHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getIt<User>();

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                user.nome,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Alunos'),
            onTap: () {
              Navigator.push(context, AlunosPage.route());
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Reclamações'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ReclamacoesAdminPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.print),
            title: Text('Relátorios'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RelatoriosAdminPage()),
              );
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Terminar sessão'),
            onTap: () {
              getIt.unregister<User>();
              Navigator.pushReplacement(context, AdminLoginPage.route());
            },
          ),
        ],
      ),
    );
  }
}
