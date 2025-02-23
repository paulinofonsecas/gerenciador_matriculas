import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/dependencies.dart';
import 'package:gerenciador_matriculas/features/client_login/client_login.dart';

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
                user.email,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Matrículas'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.users),
            title: Text('Usuários'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.message),
            title: Text('Reclamações'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              Navigator.pushReplacement(context, ClientLoginPage.route());
            },
          ),
        ],
      ),
    );
  }
}
