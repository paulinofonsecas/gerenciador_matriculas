import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/client_login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController senhaController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _senhaController = senhaController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _senhaController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: BlocBuilder<ClientLoginCubit, ClientLoginState>(
        builder: (context, state) {
          if (state is ClientLoginLoading) {
            return const CircularProgressIndicator();
          }

          return ElevatedButton(
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
                      _emailController.text,
                      _senhaController.text,
                    );
              }
            },
            child: Text('Entrar'),
          );
        },
      ),
    );
  }
}
