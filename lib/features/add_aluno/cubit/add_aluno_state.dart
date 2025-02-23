part of 'add_aluno_cubit.dart';

class AddAlunoState extends Equatable {
  const AddAlunoState({
    this.customProperty = 'Default Value',
  });

  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  AddAlunoState copyWith({
    String? customProperty,
  }) {
    return AddAlunoState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class AddAlunoInitial extends AddAlunoState {
  const AddAlunoInitial() : super();
}

class AddAlunoLoading extends AddAlunoState {
  const AddAlunoLoading() : super();
}

class AddAlunoSuccess extends AddAlunoState {
  const AddAlunoSuccess() : super();

  @override
  List<Object> get props => [];
}

class AddAlunoFailure extends AddAlunoState {
  const AddAlunoFailure() : super();
}
