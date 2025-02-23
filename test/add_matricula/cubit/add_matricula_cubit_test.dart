// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/add_matricula/cubit/cubit.dart';

void main() {
  group('AddMatriculaCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddMatriculaCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addMatriculaCubit = AddMatriculaCubit();
      expect(addMatriculaCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AddMatriculaCubit, AddMatriculaState>(
      'yourCustomFunction emits nothing',
      build: AddMatriculaCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AddMatriculaState>[],
    );
  });
}
