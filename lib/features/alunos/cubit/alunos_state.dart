part of 'alunos_cubit.dart';

/// {@template alunos}
/// AlunosState description
/// {@endtemplate}
class AlunosState extends Equatable {
  /// {@macro alunos}
  const AlunosState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AlunosState with property changes
  AlunosState copyWith({
    String? customProperty,
  }) {
    return AlunosState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template alunos_initial}
/// The initial state of AlunosState
/// {@endtemplate}
class AlunosInitial extends AlunosState {
  /// {@macro alunos_initial}
  const AlunosInitial() : super();
}
