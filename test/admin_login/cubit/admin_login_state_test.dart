// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/admin_login/cubit/cubit.dart';

void main() {
  group('AdminLoginState', () {
    test('supports value equality', () {
      expect(
        AdminLoginState(),
        equals(
          const AdminLoginState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AdminLoginState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const adminLoginState = AdminLoginState(
            customProperty: 'My property',
          );
          expect(
            adminLoginState.copyWith(),
            equals(adminLoginState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const adminLoginState = AdminLoginState(
            customProperty: 'My property',
          );
          final otherAdminLoginState = AdminLoginState(
            customProperty: 'My property 2',
          );
          expect(adminLoginState, isNot(equals(otherAdminLoginState)));

          expect(
            adminLoginState.copyWith(
              customProperty: otherAdminLoginState.customProperty,
            ),
            equals(otherAdminLoginState),
          );
        },
      );
    });
  });
}
