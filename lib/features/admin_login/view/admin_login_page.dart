import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:gerenciador_matriculas/dependencies.dart';
import 'package:gerenciador_matriculas/features/admin_home/view/admin_home_page.dart';
import 'package:gerenciador_matriculas/features/admin_login/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/admin_login/widgets/admin_login_body.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AdminLoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminLoginCubit(context.read()),
      child: const Scaffold(
        body: AdminLoginView(),
      ),
    );
  }
}

class AdminLoginView extends StatelessWidget {
  const AdminLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminLoginCubit, AdminLoginState>(
      listener: (context, state) async {
        if (state is AdminLoginSuccess) {
          if (getIt.isRegistered<User>()) {
            getIt.unregister<User>();
          }
          getIt.registerSingleton(state.user);

          Navigator.of(context).pushReplacement(AdminHomePage.route());
        }

        if (state is AdminLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao realizar login'),
            ),
          );
        }
      },
      child: const AdminLoginBody(),
    );
  }
}
