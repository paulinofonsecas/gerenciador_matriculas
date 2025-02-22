// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/cubit.dart';

void main() {
  group('ClientLoginState', () {
    test('supports value equality', () {
      expect(
        ClientLoginState(),
        equals(
          const ClientLoginState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ClientLoginState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const clientLoginState = ClientLoginState(
            customProperty: 'My property',
          );
          expect(
            clientLoginState.copyWith(),
            equals(clientLoginState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const clientLoginState = ClientLoginState(
            customProperty: 'My property',
          );
          final otherClientLoginState = ClientLoginState(
            customProperty: 'My property 2',
          );
          expect(clientLoginState, isNot(equals(otherClientLoginState)));

          expect(
            clientLoginState.copyWith(
              customProperty: otherClientLoginState.customProperty,
            ),
            equals(otherClientLoginState),
          );
        },
      );
    });
  });
}
