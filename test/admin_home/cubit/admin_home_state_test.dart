// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';

void main() {
  group('AdminHomeState', () {
    test('supports value equality', () {
      expect(
        AdminHomeState(),
        equals(
          const AdminHomeState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AdminHomeState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const adminHomeState = AdminHomeState(
            customProperty: 'My property',
          );
          expect(
            adminHomeState.copyWith(),
            equals(adminHomeState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const adminHomeState = AdminHomeState(
            customProperty: 'My property',
          );
          final otherAdminHomeState = AdminHomeState(
            customProperty: 'My property 2',
          );
          expect(adminHomeState, isNot(equals(otherAdminHomeState)));

          expect(
            adminHomeState.copyWith(
              customProperty: otherAdminHomeState.customProperty,
            ),
            equals(otherAdminHomeState),
          );
        },
      );
    });
  });
}
