// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class User {
  String id;
  String nome;
  String email;
  String telefone;

  User({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
  });
}
