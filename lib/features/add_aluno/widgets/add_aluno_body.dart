import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/features/add_aluno/cubit/add_aluno_cubit.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';
import 'package:gerenciador_matriculas/params/aluno_params.dart';

/// {@template add_aluno_body}
/// Body of the AddAlunoPage.
///
/// Add what it does
/// {@endtemplate}
class AddAlunoBody extends StatefulWidget {
  /// {@macro add_aluno_body}
  const AddAlunoBody({super.key});

  @override
  State<AddAlunoBody> createState() => _AddAlunoBodyState();
}

class _AddAlunoBodyState extends State<AddAlunoBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final aluno = context.read<AddAlunoCubit>().aluno;
    var alunoParams = AlunoParams.fromAluno(aluno);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              initialValue: aluno?.nome,
              onChanged: (value) {
                alunoParams = alunoParams.copyWith(
                  nome: value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome completo';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nome completo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Gutter(),
            TextFormField(
              initialValue: aluno?.matricula,
              onChanged: (value) {
                alunoParams = alunoParams.copyWith(
                  matricula: value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o número de matrícula';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nº Matrícula',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Gutter(),
            TextFormField(
              initialValue: aluno?.curso,
              onChanged: (value) {
                alunoParams = alunoParams.copyWith(
                  curso: value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o curso';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Curso',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Gutter(),
            TextFormField(
              initialValue: aluno?.classe,
              onChanged: (value) {
                alunoParams = alunoParams.copyWith(
                  classe: value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a classe';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Classe',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Gutter(),
            TextFormField(
              initialValue: aluno?.turma,
              onChanged: (value) {
                alunoParams = alunoParams.copyWith(
                  turma: value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a turma';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Turma',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Gutter(),
            TextFormField(
              initialValue: aluno?.telefone,
              onChanged: (value) {
                alunoParams = alunoParams.copyWith(
                  telefone: value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o número de telefone';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Nº Telefone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Gutter(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AddAlunoCubit>().addAluno(alunoParams);
                }
              },
              child: Text('Cadastrar'),
            )
          ],
        ),
      ),
    );
  }
}
