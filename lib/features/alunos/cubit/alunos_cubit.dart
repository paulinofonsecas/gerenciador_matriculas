import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'alunos_state.dart';

class AlunosCubit extends Cubit<AlunosState> {
  AlunosCubit() : super(const AlunosInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
