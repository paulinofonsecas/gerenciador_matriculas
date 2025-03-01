import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deletar_aluno_state.dart';

class DeletarAlunoCubit extends Cubit<DeletarAlunoState> {
  DeletarAlunoCubit() : super(DeletarAlunoInitial());

  final _firestore = FirebaseFirestore.instance;

  void deletarAluno(String id) async {
    emit(DeletarAlunoLoading());

    await _firestore.collection('alunos').doc(id).delete().then((_) {
      emit(DeletarAlunoSuccess());
    }).catchError((_) {
      emit(DeletarAlunoError());
    });
  }

}
