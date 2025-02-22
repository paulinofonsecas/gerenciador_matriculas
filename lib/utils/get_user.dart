import 'package:gerenciador_matriculas/data/entities/administrador.dart';
import 'package:gerenciador_matriculas/data/entities/aluno.dart';
import 'package:gerenciador_matriculas/data/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> getUser() async {
  final sp = await SharedPreferences.getInstance();

  final userType = sp.getString('user_type');

  if (userType == 'admin') {
    final admin = sp.getString('admin');
    return Administrador.fromJson(admin!);
  } else if (userType == 'aluno') {
    final aluno = sp.getString('aluno');
    return Aluno.fromJson(aluno!);
  } else {
    return null;
  }
}
