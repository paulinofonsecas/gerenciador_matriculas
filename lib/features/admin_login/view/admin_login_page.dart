import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_login/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/admin_login/widgets/admin_login_body.dart';

/// {@template admin_login_page}
/// A description for AdminLoginPage
/// {@endtemplate}
class AdminLoginPage extends StatelessWidget {
  /// {@macro admin_login_page}
  const AdminLoginPage({super.key});

  /// The static route for AdminLoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AdminLoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminLoginCubit(),
      child: const Scaffold(
        body: AdminLoginView(),
      ),
    );
  }    
}

/// {@template admin_login_view}
/// Displays the Body of AdminLoginView
/// {@endtemplate}
class AdminLoginView extends StatelessWidget {
  /// {@macro admin_login_view}
  const AdminLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminLoginBody();
  }
}
