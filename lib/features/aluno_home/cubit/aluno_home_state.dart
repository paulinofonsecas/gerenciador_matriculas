part of 'aluno_home_cubit.dart';

/// {@template aluno_home}
/// AlunoHomeState description
/// {@endtemplate}
class AlunoHomeState extends Equatable {
  /// {@macro aluno_home}
  const AlunoHomeState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AlunoHomeState with property changes
  AlunoHomeState copyWith({
    String? customProperty,
  }) {
    return AlunoHomeState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template aluno_home_initial}
/// The initial state of AlunoHomeState
/// {@endtemplate}
class AlunoHomeInitial extends AlunoHomeState {
  /// {@macro aluno_home_initial}
  const AlunoHomeInitial() : super();
}
