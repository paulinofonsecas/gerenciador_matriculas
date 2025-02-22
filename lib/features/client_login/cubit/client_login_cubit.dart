import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';

part 'client_login_state.dart';

class ClientLoginCubit extends Cubit<ClientLoginState> {
  ClientLoginCubit(this._authFirebase) : super(const ClientLoginInitial());

  final AuthFirebase _authFirebase;

  Future<void> login(String email, String password) async {
    emit(const ClientLoginLoading());

    try {
      final user = await _authFirebase.login(email, password);

      emit(ClientLoginSuccess(user));
    } catch (e) {
      emit(ClientLoginFailure(e.toString()));
    }
  }
}
