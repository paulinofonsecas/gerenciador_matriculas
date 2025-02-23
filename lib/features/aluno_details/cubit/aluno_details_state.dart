part of 'aluno_details_cubit.dart';

/// {@template aluno_details}
/// AlunoDetailsState description
/// {@endtemplate}
class AlunoDetailsState extends Equatable {
  /// {@macro aluno_details}
  const AlunoDetailsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AlunoDetailsState with property changes
  AlunoDetailsState copyWith({
    String? customProperty,
  }) {
    return AlunoDetailsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template aluno_details_initial}
/// The initial state of AlunoDetailsState
/// {@endtemplate}
class AlunoDetailsInitial extends AlunoDetailsState {
  /// {@macro aluno_details_initial}
  const AlunoDetailsInitial() : super();
}
