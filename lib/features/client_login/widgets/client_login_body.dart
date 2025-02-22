import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/cubit.dart';

/// {@template client_login_body}
/// Body of the ClientLoginPage.
///
/// Add what it does
/// {@endtemplate}
class ClientLoginBody extends StatelessWidget {
  /// {@macro client_login_body}
  const ClientLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientLoginCubit, ClientLoginState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
