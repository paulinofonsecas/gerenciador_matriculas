import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:gerenciador_matriculas/data/entities/administrador.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';

class AuthFirebase {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<User> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Administrador(
        id: userCredential.user!.uid,
        email: email,
        nome: '',
        telefone: '',
      );
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  Future<User> loginAluno(String matricula, String password) async {
    try {
      final result = await _firestore
          .collection('alunos')
          .where(
            'matricula',
            isEqualTo: matricula,
          )
          .where(
            'user.password',
            isEqualTo: password,
          )
          .get();

      final aluno = result.docs.firstOrNull;

      if (aluno == null) {
        throw Exception('Aluno não encontrado');
      }

      return Aluno(
        id: aluno.id,
        email: aluno.data()['email'],
        matricula: aluno.data()['matricula'],
        nome: aluno.data()['nome'],
        telefone: aluno.data()['telefone'],
        curso: aluno.data()['curso'],
        turma: aluno.data()['turma'],
        classe: aluno.data()['classe'],
        status: aluno.data()['status'],
      );
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  Future<void> logout() async {
    return;
  }
}
