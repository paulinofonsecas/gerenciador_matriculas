import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_login/cubit/cubit.dart';

/// {@template admin_login_body}
/// Body of the AdminLoginPage.
///
/// Add what it does
/// {@endtemplate}
class AdminLoginBody extends StatelessWidget {
  /// {@macro admin_login_body}
  const AdminLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminLoginCubit, AdminLoginState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
