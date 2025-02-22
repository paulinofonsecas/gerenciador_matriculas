import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'admin_login_state.dart';

class AdminLoginCubit extends Cubit<AdminLoginState> {
  AdminLoginCubit() : super(const AdminLoginInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
