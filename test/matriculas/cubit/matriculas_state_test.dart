// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/matriculas/cubit/cubit.dart';

void main() {
  group('MatriculasState', () {
    test('supports value equality', () {
      expect(
        MatriculasState(),
        equals(
          const MatriculasState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const MatriculasState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const matriculasState = MatriculasState(
            customProperty: 'My property',
          );
          expect(
            matriculasState.copyWith(),
            equals(matriculasState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const matriculasState = MatriculasState(
            customProperty: 'My property',
          );
          final otherMatriculasState = MatriculasState(
            customProperty: 'My property 2',
          );
          expect(matriculasState, isNot(equals(otherMatriculasState)));

          expect(
            matriculasState.copyWith(
              customProperty: otherMatriculasState.customProperty,
            ),
            equals(otherMatriculasState),
          );
        },
      );
    });
  });
}
