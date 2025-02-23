// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/add_aluno/cubit/cubit.dart';

void main() {
  group('AddAlunoCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddAlunoCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addAlunoCubit = AddAlunoCubit();
      expect(addAlunoCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AddAlunoCubit, AddAlunoState>(
      'yourCustomFunction emits nothing',
      build: AddAlunoCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AddAlunoState>[],
    );
  });
}
