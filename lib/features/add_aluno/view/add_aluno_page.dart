import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/add_aluno/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/add_aluno/widgets/add_aluno_body.dart';

class AddAlunoPage extends StatelessWidget {
  const AddAlunoPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddAlunoPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAlunoCubit(),
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
