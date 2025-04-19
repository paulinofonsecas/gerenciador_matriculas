import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gerenciador_matriculas/data/entities/administrador.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gerenciador_matriculas/data/services/login_cache.dart';

part 'admin_login_state.dart';

class AdminLoginCubit extends Cubit<AdminLoginState> {
  AdminLoginCubit(this._authFirebase) : super(const AdminLoginInitial());

  final AuthFirebase _authFirebase;

  Future<void> login(String email, String password) async {
    emit(const AdminLoginLoading());

    try {
      final user = await _authFirebase.login(email, password);

      await _saveUser(user);
      if (user is Administrador) {
        await LoginCache.saveAdmin(email, password);
      }
      emit(AdminLoginSuccess(user));
    } catch (e) {
      emit(AdminLoginFailure(e.toString()));
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
