import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/view/reclamacoes_admin_page.dart';
import 'package:gerenciador_matriculas/features/alunos/view/alunos_page.dart';
import 'package:gerenciador_matriculas/features/relatorios/relatorios_admin_page.dart';

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
            title: 'Reclamações',
            icon: Icons.message,
            color: Colors.orange,
            onTap: () {
              Navigator.push(context, ReclamacoesAdminPage.route());
            },
          ),
          ButtonPanelWidget(
            title: 'Relatórios',
            icon: Icons.print,
            color: Colors.purple,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const RelatoriosAdminPage()));
            },
          ),
          ButtonPanelWidget(
            title: 'Administradores',
            icon: Icons.admin_panel_settings,
            color: Colors.blue,
            onTap: () {
              Navigator.pushNamed(context, '/create_disciplina');
            },
          ),
        ],
      ),
    );
  }
}
