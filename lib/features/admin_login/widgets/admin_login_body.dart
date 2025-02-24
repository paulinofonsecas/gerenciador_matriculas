import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/features/admin_login/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/client_login/view/client_login_page.dart';

/// {@template admin_login_body}
/// Body of the AdminLoginPage.
///
/// Add what it does
/// {@endtemplate}
class AdminLoginBody extends StatefulWidget {
  /// {@macro admin_login_body}
  const AdminLoginBody({super.key});

  @override
  State<AdminLoginBody> createState() => _AdminLoginBodyState();
}

class _AdminLoginBodyState extends State<AdminLoginBody> {
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
                        return 'Por favor, insira o Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: BlocBuilder<AdminLoginCubit, AdminLoginState>(
                      builder: (context, state) {
                        if (state is AdminLoginLoading) {
                          return const CircularProgressIndicator();
                        }

                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AdminLoginCubit>().login(
                                    _emailController.text,
                                    _senhaController.text,
                                  );
                            }
                          },
                          child: Text('Entrar'),
                        );
                      },
                    ),
                  ),
                  Gutter(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(ClientLoginPage.route());
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text('Entrar como aluno'),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(  
              height: 20,
              child: Text(
                'Criado pela equipe A. V1.0.0',
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
