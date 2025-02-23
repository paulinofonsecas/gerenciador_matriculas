// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/alunos/cubit/cubit.dart';

void main() {
  group('AlunosCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AlunosCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final alunosCubit = AlunosCubit();
      expect(alunosCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AlunosCubit, AlunosState>(
      'yourCustomFunction emits nothing',
      build: AlunosCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AlunosState>[],
    );
  });
}
