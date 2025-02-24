import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/data/services/auth_firebase.dart';
import 'package:gerenciador_matriculas/dependencies.dart';
import 'package:gerenciador_matriculas/features/aluno_home/view/aluno_home_page.dart';
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
      listener: (context, state) async {
        if (state is ClientLoginSuccess) {
          getIt.unregister<User>();
          getIt.registerSingleton(state.user);

          Navigator.of(context).pushAndRemoveUntil(
            AlunoHomePage.route(),
            (route) => false,
          );
        }

        if (state is ClientLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao realizar login'),
            ),
          );
        }
      },
      child: const ClientLoginBody(),
    );
  }
}
