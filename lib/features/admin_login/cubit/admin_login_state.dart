part of 'admin_login_cubit.dart';

/// {@template admin_login}
/// AdminLoginState description
/// {@endtemplate}
class AdminLoginState extends Equatable {
  /// {@macro admin_login}
  const AdminLoginState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AdminLoginState with property changes
  AdminLoginState copyWith({
    String? customProperty,
  }) {
    return AdminLoginState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template admin_login_initial}
/// The initial state of AdminLoginState
/// {@endtemplate}
class AdminLoginInitial extends AdminLoginState {
  /// {@macro admin_login_initial}
  const AdminLoginInitial() : super();
}
