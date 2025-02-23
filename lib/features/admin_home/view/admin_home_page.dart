import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/admin_home/view/admin_home_drawer.dart';
import 'package:gerenciador_matriculas/features/admin_home/widgets/admin_home_body.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AdminHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminHomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tela do Administrador'),
        ),
        drawer: const AdminHomeDrawer(),
        body: AdminHomeView(),
      ),
    );
  }
}

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminHomeBody();
  }
}
