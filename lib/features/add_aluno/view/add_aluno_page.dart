import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/features/add_aluno/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/add_aluno/widgets/add_aluno_body.dart';

class AddAlunoPage extends StatelessWidget {
  const AddAlunoPage({super.key, required this.aluno});

  final Aluno? aluno;

  static Route<dynamic> route({Aluno? aluno}) {
    return MaterialPageRoute<dynamic>(
        builder: (_) => AddAlunoPage(
              aluno: aluno,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAlunoCubit(
        aluno: aluno,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Aluno'),
        ),
        body: AddAlunoView(),
      ),
    );
  }
}

class AddAlunoView extends StatelessWidget {
  const AddAlunoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAlunoCubit, AddAlunoState>(
      listener: (context, state) {
        if (state is AddAlunoSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Aluno cadastrado com sucesso.'),
            ),
          );
        }

        if (state is EditAlunoSuccess) {
          Navigator.of(context).pop();
        }

        if (state is AddAlunoFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ocorreu um erro ao cadastrar o aluno.'),
            ),
          );
        }
      },
      child: const AddAlunoBody(),
    );
  }
}
