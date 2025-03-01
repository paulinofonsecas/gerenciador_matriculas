part of 'deletar_aluno_cubit.dart';

sealed class DeletarAlunoState extends Equatable {
  const DeletarAlunoState();

  @override
  List<Object> get props => [];
}

final class DeletarAlunoInitial extends DeletarAlunoState {}

final class DeletarAlunoLoading extends DeletarAlunoState {}

final class DeletarAlunoSuccess extends DeletarAlunoState {}

final class DeletarAlunoError extends DeletarAlunoState {}
