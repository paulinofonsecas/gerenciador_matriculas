import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';

import 'duet_info.dart';

class AlunoDetailsBody extends StatelessWidget {
  const AlunoDetailsBody({super.key, required this.aluno});

  final Aluno aluno;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
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
          Gutter(),
          Divider(),
          Gutter(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Informações adicionais',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DuetInfo(title: 'Email', subtitle: aluno.email),
          DuetInfo(
            title: 'Estado',
            subtitle: aluno.status == true ? 'Ativo' : 'Inativo',
          ),
          Gutter(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Criar novo Usuário'),
          ),
        ],
      ),
    );
  }
}
