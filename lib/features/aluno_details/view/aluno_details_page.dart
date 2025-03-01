import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/features/add_aluno/view/add_aluno_page.dart';
import 'package:gerenciador_matriculas/features/aluno_details/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/aluno_details/cubit/deletar_aluno_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlunoDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => DeletarAlunoCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Detalhes do Aluno'), actions: [
            BlocConsumer<DeletarAlunoCubit, DeletarAlunoState>(
              listener: (context, state) {
                if (state is DeletarAlunoSuccess) {
                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Aluno deletado com sucesso'),
                    ),
                  );
                }

                if (state is DeletarAlunoError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Erro ao deletar o aluno'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is DeletarAlunoLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  );
                }

                return IconButton(
                  onPressed: () {
                    final cubit = context.read<DeletarAlunoCubit>();

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirmar Deleção'),
                          content: const Text(
                              'Você tem certeza que deseja deletar este aluno?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                cubit.deletarAluno(aluno.id);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              child: const Text('Deletar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.delete),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(AddAlunoPage.route(aluno: aluno))
                    .then((value) {
                  // ignore: use_build_context_synchronously
                  context.read<AlunoDetailsCubit>().getAluno(aluno.id);
                });
              },
              child: const Text('Editar'),
            ),
          ]),
          body: AlunoDetailsView(
            aluno: aluno,
          ),
        );
      }),
    );
  }
}

class AlunoDetailsView extends StatelessWidget {
  const AlunoDetailsView({super.key, required this.aluno});

  final Aluno aluno;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlunoDetailsCubit, AlunoDetailsState>(
      buildWhen: (previous, current) => current is AlunoDetailsLoaded,
      builder: (context, state) {
        if (state is AlunoDetailsLoaded) {
          return AlunoDetailsBody(aluno: state.aluno);
        }

        if (state is AlunoDetailsError) {
          return const Center(
            child: Text('Erro ao carregar os dados do aluno'),
          );
        }

        return AlunoDetailsBody(aluno: aluno);
      },
    );
  }
}
