part of 'client_login_cubit.dart';

/// {@template client_login}
/// ClientLoginState description
/// {@endtemplate}
class ClientLoginState extends Equatable {
  /// {@macro client_login}
  const ClientLoginState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ClientLoginState with property changes
  ClientLoginState copyWith({
    String? customProperty,
  }) {
    return ClientLoginState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template client_login_initial}
/// The initial state of ClientLoginState
/// {@endtemplate}
class ClientLoginInitial extends ClientLoginState {
  /// {@macro client_login_initial}
  const ClientLoginInitial() : super();
}
