import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gerenciador_matriculas/features/alunos/view/alunos_page.dart';

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
            title: 'Matriculas',
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

class ButtonPanelWidget extends StatelessWidget {
  const ButtonPanelWidget({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (color ?? Colors.green).withValues(alpha: .25),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 25),
              GutterTiny(),
              Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
