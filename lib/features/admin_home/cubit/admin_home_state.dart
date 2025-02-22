part of 'admin_home_cubit.dart';

/// {@template admin_home}
/// AdminHomeState description
/// {@endtemplate}
class AdminHomeState extends Equatable {
  /// {@macro admin_home}
  const AdminHomeState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AdminHomeState with property changes
  AdminHomeState copyWith({
    String? customProperty,
  }) {
    return AdminHomeState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template admin_home_initial}
/// The initial state of AdminHomeState
/// {@endtemplate}
class AdminHomeInitial extends AdminHomeState {
  /// {@macro admin_home_initial}
  const AdminHomeInitial() : super();
}
