import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/features/admin_login/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/client_login_cubit.dart';

class ClientLoginBody extends StatefulWidget {
  const ClientLoginBody({super.key});

  @override
  State<ClientLoginBody> createState() => _ClientLoginBodyState();
}

class _ClientLoginBodyState extends State<ClientLoginBody> {
  final _formKey = GlobalKey<FormState>();
  final _matriculaController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(),
            TextFormField(
              controller: _matriculaController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o número de matrícula';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Nº de Matrícula',
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<ClientLoginCubit>().login(
                      _matriculaController.text,
                      _senhaController.text,
                    );
                  }
                },
                child: Text('Entrar'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
