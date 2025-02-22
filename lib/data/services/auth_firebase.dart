import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:gerenciador_matriculas/data/entities/administrador.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';

class AuthFirebase {
  final _auth = FirebaseAuth.instance;

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

  Future<void> logout() async {
    return;
  }
}
