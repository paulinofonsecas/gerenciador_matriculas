// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/matriculas/cubit/cubit.dart';

void main() {
  group('MatriculasCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          MatriculasCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final matriculasCubit = MatriculasCubit();
      expect(matriculasCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<MatriculasCubit, MatriculasState>(
      'yourCustomFunction emits nothing',
      build: MatriculasCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <MatriculasState>[],
    );
  });
}
