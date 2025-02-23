// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/alunos/cubit/cubit.dart';

void main() {
  group('AlunosState', () {
    test('supports value equality', () {
      expect(
        AlunosState(),
        equals(
          const AlunosState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AlunosState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const alunosState = AlunosState(
            customProperty: 'My property',
          );
          expect(
            alunosState.copyWith(),
            equals(alunosState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const alunosState = AlunosState(
            customProperty: 'My property',
          );
          final otherAlunosState = AlunosState(
            customProperty: 'My property 2',
          );
          expect(alunosState, isNot(equals(otherAlunosState)));

          expect(
            alunosState.copyWith(
              customProperty: otherAlunosState.customProperty,
            ),
            equals(otherAlunosState),
          );
        },
      );
    });
  });
}
