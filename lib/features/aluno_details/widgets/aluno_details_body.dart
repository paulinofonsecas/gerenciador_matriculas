import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';

class AlunoDetailsBody extends StatelessWidget {
  const AlunoDetailsBody({super.key, required this.aluno});

  final Aluno aluno;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
        ],
      ),
    );
  }
}

class DuetInfo extends StatelessWidget {
  const DuetInfo({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
