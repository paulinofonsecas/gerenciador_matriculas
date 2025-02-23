// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/add_aluno/cubit/cubit.dart';

void main() {
  group('AddAlunoState', () {
    test('supports value equality', () {
      expect(
        AddAlunoState(),
        equals(
          const AddAlunoState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddAlunoState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addAlunoState = AddAlunoState(
            customProperty: 'My property',
          );
          expect(
            addAlunoState.copyWith(),
            equals(addAlunoState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addAlunoState = AddAlunoState(
            customProperty: 'My property',
          );
          final otherAddAlunoState = AddAlunoState(
            customProperty: 'My property 2',
          );
          expect(addAlunoState, isNot(equals(otherAddAlunoState)));

          expect(
            addAlunoState.copyWith(
              customProperty: otherAddAlunoState.customProperty,
            ),
            equals(otherAddAlunoState),
          );
        },
      );
    });
  });
}
