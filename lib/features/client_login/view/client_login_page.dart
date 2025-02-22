import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/client_login/widgets/client_login_body.dart';

/// {@template client_login_page}
/// A description for ClientLoginPage
/// {@endtemplate}
class ClientLoginPage extends StatelessWidget {
  /// {@macro client_login_page}
  const ClientLoginPage({super.key});

  /// The static route for ClientLoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ClientLoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientLoginCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: ClientLoginView(),
      ),
    );
  }
}

/// {@template client_login_view}
/// Displays the Body of ClientLoginView
/// {@endtemplate}
class ClientLoginView extends StatelessWidget {
  /// {@macro client_login_view}
  const ClientLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClientLoginBody();
  }
}
