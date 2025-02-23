// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/add_matricula/cubit/cubit.dart';

void main() {
  group('AddMatriculaState', () {
    test('supports value equality', () {
      expect(
        AddMatriculaState(),
        equals(
          const AddMatriculaState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddMatriculaState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addMatriculaState = AddMatriculaState(
            customProperty: 'My property',
          );
          expect(
            addMatriculaState.copyWith(),
            equals(addMatriculaState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addMatriculaState = AddMatriculaState(
            customProperty: 'My property',
          );
          final otherAddMatriculaState = AddMatriculaState(
            customProperty: 'My property 2',
          );
          expect(addMatriculaState, isNot(equals(otherAddMatriculaState)));

          expect(
            addMatriculaState.copyWith(
              customProperty: otherAddMatriculaState.customProperty,
            ),
            equals(otherAddMatriculaState),
          );
        },
      );
    });
  });
}
