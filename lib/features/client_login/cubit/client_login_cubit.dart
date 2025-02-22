import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gerenciador_matriculas/data/entities/administrador.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'client_login_state.dart';

class ClientLoginCubit extends Cubit<ClientLoginState> {
  ClientLoginCubit(this._authFirebase) : super(const ClientLoginInitial());

  final AuthFirebase _authFirebase;

  Future<void> login(String email, String password) async {
    emit(const ClientLoginLoading());

    try {
      final user = await _authFirebase.login(email, password);

      await _saveUser(user);

      emit(ClientLoginSuccess(user));
    } catch (e) {
      emit(ClientLoginFailure(e.toString()));
    }
  }

  Future<void> _saveUser(User user) async {
    final sp = await SharedPreferences.getInstance();

    if (user is Administrador) {
      await sp.remove('admin');

      await sp.setString('user_type', 'admin');
      await sp.setString('admin', user.toJson());
    } else if (user is Aluno) {
      await sp.remove('aluno');

      await sp.setString('user_type', 'aluno');
      await sp.setString('aluno', user.toJson());
    }
  }
}
