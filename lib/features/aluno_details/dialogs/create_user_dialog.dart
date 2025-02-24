import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:password_generator/password_generator.dart';

class CreateUserDialog extends StatefulWidget {
  const CreateUserDialog({
    super.key,
    required this.aluno,
    this.autoGeneratePassword = false,
  });

  final Aluno aluno;
  final bool autoGeneratePassword;

  static Future<void> show(BuildContext context, Aluno aluno,
      [bool autoGeneratePassword = false]) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => CreateUserDialog(
        aluno: aluno,
        autoGeneratePassword: autoGeneratePassword,
      ),
    );
  }

  @override
  State<CreateUserDialog> createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends State<CreateUserDialog> {
  final _firestore = FirebaseFirestore.instance;
  var _isCreatingUser = false;
  var _generatedPassword = '';
  var _isCreated = false;

  @override
  initState() {
    super.initState();
    if (widget.autoGeneratePassword) {
      _updateUser();
    }
  }

  String gp() {
    final passwordGenerator = PasswordGenerator(
      length: 6,
      hasNumbers: true,
      hasSmallLetters: true,
      hasCapitalLetters: false,
      hasSymbols: false,
    );

    // We call the generatePassword method on the PasswordGenerator instance
    // that returns a String.
    final String password = passwordGenerator.generatePassword();

    return password;
  }

  void _createUser() async {
    setState(() => _isCreatingUser = true);
    final newPassword = gp();

    await _firestore
        .collection('alunos')
        .doc(widget.aluno.id)
        .set({'user.password': newPassword});

    _generatedPassword = newPassword;
    setState(() {
      _isCreatingUser = false;
      _generatedPassword = _generatedPassword;
      _isCreated = true;
    });
  }

  void _updateUser() async {
    setState(() => _isCreatingUser = true);
    final newPassword = gp();

    await _firestore
        .collection('alunos')
        .doc(widget.aluno.id)
        .update({'user.password': newPassword});

    _generatedPassword = newPassword;
    setState(() {
      _isCreatingUser = false;
      _generatedPassword = _generatedPassword;
      _isCreated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Criar usuário'),
      content: Builder(builder: (context) {
        if (_isCreatingUser) {
          return SizedBox(
            width: 50,
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (_isCreated) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gutter(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Usuário: ${widget.aluno.matricula}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  Gutter(),
                  Text(
                    'Senha: $_generatedPassword',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
              Gutter(),
              Divider(),
              Align(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:
                        Theme.of(context).colorScheme.onErrorContainer,
                  ),
                  child: const Text('Fechar'),
                ),
              ),
            ],
          );
        }

        return RichText(
          text: TextSpan(
            text: 'Deseja criar um usuário para o aluno ',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            children: [
              TextSpan(
                text: ' ${widget.aluno.nome}?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        );
      }),
      actions: _isCreatingUser || _isCreated
          ? null
          : [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Não'),
              ),
              TextButton(
                onPressed: _createUser,
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                ),
                child: const Text('Sim'),
              ),
            ],
    );
  }
}
