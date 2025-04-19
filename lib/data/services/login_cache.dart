import 'package:shared_preferences/shared_preferences.dart';

class LoginCache {
  static const _keyEmail = 'login_email';
  static const _keyPassword = 'login_password';
  static const _keyMatricula = 'login_matricula';
  static const _keyIsAluno = 'login_is_aluno';

  static Future<void> saveAdmin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
    await prefs.setBool(_keyIsAluno, false);
  }

  static Future<void> saveAluno(String matricula, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyMatricula, matricula);
    await prefs.setString(_keyPassword, password);
    await prefs.setBool(_keyIsAluno, true);
  }

  static Future<Map<String, String>?> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isAluno = prefs.getBool(_keyIsAluno);
    if (isAluno == null) return null;
    if (isAluno) {
      final matricula = prefs.getString(_keyMatricula);
      final password = prefs.getString(_keyPassword);
      if (matricula != null && password != null) {
        return {'matricula': matricula, 'password': password, 'isAluno': 'true'};
      }
    } else {
      final email = prefs.getString(_keyEmail);
      final password = prefs.getString(_keyPassword);
      if (email != null && password != null) {
        return {'email': email, 'password': password, 'isAluno': 'false'};
      }
    }
    return null;
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyPassword);
    await prefs.remove(_keyMatricula);
    await prefs.remove(_keyIsAluno);
  }
}
