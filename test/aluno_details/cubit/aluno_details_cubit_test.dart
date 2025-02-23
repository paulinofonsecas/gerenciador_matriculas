// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/aluno_details/cubit/cubit.dart';

void main() {
  group('AlunoDetailsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AlunoDetailsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final alunoDetailsCubit = AlunoDetailsCubit();
      expect(alunoDetailsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AlunoDetailsCubit, AlunoDetailsState>(
      'yourCustomFunction emits nothing',
      build: AlunoDetailsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AlunoDetailsState>[],
    );
  });
}
