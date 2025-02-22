part of 'client_login_cubit.dart';

class ClientLoginState extends Equatable {
  const ClientLoginState({this.customProperty = 'Default Value'});

  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  ClientLoginState copyWith({String? customProperty}) {
    return ClientLoginState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class ClientLoginInitial extends ClientLoginState {
  const ClientLoginInitial() : super();
}

class ClientLoginLoading extends ClientLoginState {
  const ClientLoginLoading() : super();
}

class ClientLoginSuccess extends ClientLoginState {
  const ClientLoginSuccess(this.user) : super();

  final User user;

  @override
  List<Object> get props => [user];
}

class ClientLoginFailure extends ClientLoginState {
  const ClientLoginFailure(this.error) : super();

  final String error;

  @override
  List<Object> get props => [error];
}
