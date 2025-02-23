import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/features/add_aluno/add_aluno.dart';
import 'package:gerenciador_matriculas/features/alunos/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/alunos/widgets/alunos_body.dart';

class AlunosPage extends StatelessWidget {
  const AlunosPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AlunosPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlunosCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Alunos'), actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          GutterSmall(),
        ]),
        body: AlunosView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(AddAlunoPage.route());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class AlunosView extends StatelessWidget {
  const AlunosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlunosBody();
  }
}
