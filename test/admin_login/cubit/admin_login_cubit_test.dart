// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/admin_login/cubit/cubit.dart';

void main() {
  group('AdminLoginCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AdminLoginCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final adminLoginCubit = AdminLoginCubit();
      expect(adminLoginCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AdminLoginCubit, AdminLoginState>(
      'yourCustomFunction emits nothing',
      build: AdminLoginCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AdminLoginState>[],
    );
  });
}
