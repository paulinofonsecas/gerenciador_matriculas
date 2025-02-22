// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';

void main() {
  group('AdminHomeCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AdminHomeCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final adminHomeCubit = AdminHomeCubit();
      expect(adminHomeCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AdminHomeCubit, AdminHomeState>(
      'yourCustomFunction emits nothing',
      build: AdminHomeCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AdminHomeState>[],
    );
  });
}
