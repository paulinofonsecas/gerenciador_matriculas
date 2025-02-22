import 'package:gerenciador_matriculas/data/entities/administrador.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';

class AuthFirebase {
  Future<User> login(String email, String password) async {
    return Administrador(
      id: '1',
      email: email,
      nome: 'Administrador',
      telefone: '123456789',
    );
  }

  Future<void> logout() async {
    return;
  }
}
