import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/dependencies.dart';
import 'package:gerenciador_matriculas/features/aluno_details/widgets/duet_info.dart';
import 'package:gerenciador_matriculas/features/client_login/view/client_login_page.dart';

class AlunoHomeBody extends StatelessWidget {
  const AlunoHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final aluno = getIt<User>() as Aluno;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            child: CircleAvatar(
              radius: 80,
              child: const Icon(
                Icons.person,
                size: 100,
              ),
            ),
          ),
          Gutter(),
          Text(
            aluno.nome,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gutter(),
          Divider(),
          Gutter(),
          DuetInfo(title: 'Matrícula', subtitle: aluno.matricula),
          DuetInfo(title: 'Curso', subtitle: aluno.curso),
          DuetInfo(title: 'Classe', subtitle: aluno.classe),
          DuetInfo(title: 'Turma', subtitle: aluno.turma),
          DuetInfo(title: 'Telefone', subtitle: aluno.telefone),
          GutterLarge(),
          ElevatedButton(
            onPressed: () {
              getIt.unregister<User>();
              Navigator.pushReplacement(context, ClientLoginPage.route());
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
            ),
            child: const Text('Terminar sessão'),
          ),
        ],
      ),
    );
  }
}
