import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/admin_login/view/admin_login_page.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/client_login_cubit.dart';

import 'login_button_widget.dart';

class ClientLoginBody extends StatefulWidget {
  const ClientLoginBody({super.key});

  @override
  State<ClientLoginBody> createState() => _ClientLoginBodyState();
}

class _ClientLoginBodyState extends State<ClientLoginBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: FlutterLogo(
                size: 220,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o número de matrícula';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nº de matrícula',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Gutter(),
                  TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a senha';
                      }

                      if (value.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  GutterLarge(),
                  LoginButtonWidget(
                    title: 'Entrar',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ClientLoginCubit>().login(
                              _emailController.text,
                              _senhaController.text,
                            );
                      }
                    },
                  ),
                  Gutter(),
                  TextButton(
                    onPressed: () {
                      if (context.read<ClientLoginCubit>().state
                          is ClientLoginSuccess) {
                        return;
                      }

                      Navigator.of(context).push(AdminLoginPage.route());
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text('Entrar como administrador'),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: Text(
                'Criado pela equipe A. v1.0.0',
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
