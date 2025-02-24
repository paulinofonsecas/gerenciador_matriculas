import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/params/aluno_params.dart';
import 'package:uuid/uuid.dart';

part 'add_aluno_state.dart';

class AddAlunoCubit extends Cubit<AddAlunoState> {
  AddAlunoCubit({this.aluno}) : super(const AddAlunoInitial());

  Aluno? aluno;
  final firestore = FirebaseFirestore.instance;

  void addAluno(AlunoParams params) async {
    try {
      emit(const AddAlunoLoading());

      if (aluno != null) {
        await firestore.collection('alunos').doc(aluno!.id).update({
          'nome': params.nome,
          'telefone': params.telefone,
          'matricula': params.matricula,
          'curso': params.curso,
          'classe': params.classe,
          'turma': params.turma,
        });
      } else {
        await createAluno(params);
      }
      emit(const AddAlunoSuccess());
    } catch (e) {
      emit(AddAlunoFailure());
    }
  }

  Future<void> createAluno(AlunoParams params) async {
    final aluno = Aluno(
      id: Uuid().v4(),
      email: '',
      nome: params.nome,
      telefone: params.telefone,
      matricula: params.matricula,
      curso: params.curso,
      classe: params.classe,
      turma: params.turma,
      status: false,
    );

    await firestore.collection('alunos').doc(aluno.id).set(aluno.toMap());
  }
}
