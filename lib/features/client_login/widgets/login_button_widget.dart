import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/features/admin_home/cubit/cubit.dart';
import 'package:gerenciador_matriculas/features/client_login/cubit/client_login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final GestureTapCallback? onTap;

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
            onPressed: onTap,
            child: Text(title),
          );
        },
      ),
    );
  }
}
