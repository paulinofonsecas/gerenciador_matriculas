import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/features/aluno_details/view/aluno_details_page.dart';

class AlunosBody extends StatefulWidget {
  const AlunosBody({super.key});

  @override
  State<AlunosBody> createState() => _AlunosBodyState();
}

class _AlunosBodyState extends State<AlunosBody> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Aluno>>(
        stream: firestore.collection('alunos').snapshots().map((snapshot) =>
            snapshot.docs.map((doc) => Aluno.fromMap(doc.data())).toList()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Erro ao carregar os dados');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhum aluno cadastrado'),
            );
          }

          final alunos = snapshot.data!;

          return ListView.builder(
            itemCount: alunos.length,
            itemBuilder: (context, index) {
              final aluno = alunos[index];

              return ListTile(
                onTap: () {
                  Navigator.of(context).push(AlunoDetailsPage.route(aluno));
                },
                title: Text(aluno.nome),
                subtitle: Text(
                    '${aluno.classe}ª classe, Matrícula: ${aluno.matricula}'),
                leading: CircleAvatar(
                  child: Center(
                    child: Text(aluno.nome[0].toUpperCase()),
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
              );
            },
          );
        });
  }
}
