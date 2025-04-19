import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/aluno_home/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/aluno_home/widgets/aluno_home_body.dart';
import 'package:gerenciador_matriculas/features/aluno_home/view/reclamacao_page.dart';

class AlunoHomePage extends StatelessWidget {
  const AlunoHomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AlunoHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlunoHomeCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Página Inicial'), actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ReclamacaoPage()),
              );
            },
            icon: const Icon(Icons.message_sharp),
            label: const Text('Reclamar'),
          ),
        ]),
        body: AlunoHomeView(),
      ),
    );
  }
}

class AlunoHomeView extends StatelessWidget {
  const AlunoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlunoHomeBody();
  }
}
