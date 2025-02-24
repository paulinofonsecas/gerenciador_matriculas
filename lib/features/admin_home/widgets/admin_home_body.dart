import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerenciador_matriculas/features/alunos/view/alunos_page.dart';

import 'button_panel_widget.dart';

class AdminHomeBody extends StatelessWidget {
  const AdminHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: [
          ButtonPanelWidget(
            title: 'Alunos',
            icon: Icons.book,
            color: Colors.green,
            onTap: () {
              Navigator.push(context, AlunosPage.route());
            },
          ),
          ButtonPanelWidget(
            title: 'Usuários',
            icon: FontAwesomeIcons.users,
            color: Colors.blue,
            onTap: () {},
          ),
          ButtonPanelWidget(
            title: 'Reclamações',
            icon: Icons.message,
            color: Colors.orange,
            onTap: () {
              Navigator.pushNamed(context, '/create_professor');
            },
          ),
          ButtonPanelWidget(
            title: 'Relatórios',
            icon: Icons.print,
            color: Colors.purple,
            onTap: () {
              Navigator.pushNamed(context, '/create_disciplina');
            },
          ),
        ],
      ),
    );
  }
}
