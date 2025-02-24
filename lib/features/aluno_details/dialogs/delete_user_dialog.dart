// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';

class DeleteUserDialog extends StatefulWidget {
  const DeleteUserDialog({super.key, required this.aluno});

  final Aluno aluno;

  static Future<void> show(
    BuildContext context,
    Aluno aluno,
  ) {
    return showDialog<void>(
      context: context,
      builder: (context) => DeleteUserDialog(aluno: aluno),
    );
  }

  @override
  State<DeleteUserDialog> createState() => _DeleteUserDialogState();
}

class _DeleteUserDialogState extends State<DeleteUserDialog> {
  final _firestore = FirebaseFirestore.instance;
  var _isLoading = false;

  Future<void> _deleteUser() async {
    setState(() {
      _isLoading = true;
    });

    await _firestore
        .collection('alunos')
        .doc(widget.aluno.id)
        .set(widget.aluno.copyWith(status: false).toMap());

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Usuário excluído com sucesso!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Excluir usuário'),
      content: Builder(builder: (context) {
        if (_isLoading) {
          return SizedBox(
            width: 50,
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        return const Text('Tem certeza que deseja excluir o usuário?');
      }),
      actions: _isLoading
          ? null
          : [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: _deleteUser,
                style: TextButton.styleFrom(
                  backgroundColor: ColorScheme.fromSeed(
                    seedColor: Colors.red,
                  ).error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                ),
                child: const Text('Excluir'),
              ),
            ],
    );
  }
}

// 9mh860
