import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'aluno_details_state.dart';

class AlunoDetailsCubit extends Cubit<AlunoDetailsState> {
  AlunoDetailsCubit() : super(const AlunoDetailsInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
