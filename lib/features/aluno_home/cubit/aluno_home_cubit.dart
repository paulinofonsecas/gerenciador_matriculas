import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'aluno_home_state.dart';

class AlunoHomeCubit extends Cubit<AlunoHomeState> {
  AlunoHomeCubit() : super(const AlunoHomeInitial());
}
