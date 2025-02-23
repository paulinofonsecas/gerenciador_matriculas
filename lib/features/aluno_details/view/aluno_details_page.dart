import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/features/aluno_details/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/aluno_details/widgets/aluno_details_body.dart';

class AlunoDetailsPage extends StatelessWidget {
  const AlunoDetailsPage({super.key, required this.aluno});

  final Aluno aluno;

  static Route<dynamic> route(Aluno aluno) {
    return MaterialPageRoute<dynamic>(
        builder: (_) => AlunoDetailsPage(aluno: aluno));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlunoDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes do Aluno'),
        ),
        body: AlunoDetailsView(
          aluno: aluno,
        ),
      ),
    );
  }
}

class AlunoDetailsView extends StatelessWidget {
  const AlunoDetailsView({super.key, required this.aluno});

  final Aluno aluno;

  @override
  Widget build(BuildContext context) {
    return AlunoDetailsBody(aluno: aluno);
  }
}
