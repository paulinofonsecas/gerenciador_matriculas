// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/aluno_details/cubit/cubit.dart';

void main() {
  group('AlunoDetailsState', () {
    test('supports value equality', () {
      expect(
        AlunoDetailsState(),
        equals(
          const AlunoDetailsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AlunoDetailsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const alunoDetailsState = AlunoDetailsState(
            customProperty: 'My property',
          );
          expect(
            alunoDetailsState.copyWith(),
            equals(alunoDetailsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const alunoDetailsState = AlunoDetailsState(
            customProperty: 'My property',
          );
          final otherAlunoDetailsState = AlunoDetailsState(
            customProperty: 'My property 2',
          );
          expect(alunoDetailsState, isNot(equals(otherAlunoDetailsState)));

          expect(
            alunoDetailsState.copyWith(
              customProperty: otherAlunoDetailsState.customProperty,
            ),
            equals(otherAlunoDetailsState),
          );
        },
      );
    });
  });
}
