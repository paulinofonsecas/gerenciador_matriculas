// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/cubit.dart';

void main() {
  group('ClientLoginCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ClientLoginCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final clientLoginCubit = ClientLoginCubit();
      expect(clientLoginCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<ClientLoginCubit, ClientLoginState>(
      'yourCustomFunction emits nothing',
      build: ClientLoginCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <ClientLoginState>[],
    );
  });
}
