import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';

part 'aluno_details_state.dart';

class AlunoDetailsCubit extends Cubit<AlunoDetailsState> {
  AlunoDetailsCubit() : super(const AlunoDetailsInitial());

  final _firestore = FirebaseFirestore.instance;

  void getAluno(String id) async {
    emit(const AlunoDetailsLoading());

    await _firestore.collection('alunos').doc(id).get().then((value) {
      final aluno = Aluno.fromMap(value.data()!);
      emit(AlunoDetailsLoaded(aluno));
    }).catchError((_) {
      emit(AlunoDetailsError());
    });
  }
}
