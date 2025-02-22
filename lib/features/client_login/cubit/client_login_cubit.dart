import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'client_login_state.dart';

class ClientLoginCubit extends Cubit<ClientLoginState> {
  ClientLoginCubit() : super(const ClientLoginInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
