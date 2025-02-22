import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/admin_home/view/admin_home_drawer.dart';
import 'package:gerenciador_matriculas/features/admin_home/widgets/admin_home_body.dart';

/// {@template admin_home_page}
/// A description for AdminHomePage
/// {@endtemplate}
class AdminHomePage extends StatelessWidget {
  /// {@macro admin_home_page}
  const AdminHomePage({super.key});

  /// The static route for AdminHomePage
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

/// {@template admin_home_view}
/// Displays the Body of AdminHomeView
/// {@endtemplate}
class AdminHomeView extends StatelessWidget {
  /// {@macro admin_home_view}
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminHomeBody();
  }
}
