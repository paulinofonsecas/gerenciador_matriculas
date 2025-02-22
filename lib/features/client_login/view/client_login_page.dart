import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/client_login/widgets/client_login_body.dart';

class ClientLoginPage extends StatelessWidget {
  const ClientLoginPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ClientLoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientLoginCubit(context.read<AuthFirebase>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: ClientLoginView(),
      ),
    );
  }
}

class ClientLoginView extends StatelessWidget {
  const ClientLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClientLoginCubit, ClientLoginState>(
      listener: (context, state) {
        if (state is ClientLoginSuccess) {
          print(state.user);
        }

        if (state is ClientLoginFailure) {
          print(state.error);
        }
      },
      child: const ClientLoginBody(),
    );
  }
}
