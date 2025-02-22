// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gerenciador_matriculas/data/entities/user.dart';

class Administrador extends User {
  Administrador({
    required super.id,
    required super.nome,
    required super.email,
    required super.telefone,
  });

  Administrador copyWith({
    String? id,
    String? nome,
    String? email,
    String? telefone,
  }) {
    return Administrador(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
    };
  }

  factory Administrador.fromMap(Map<String, dynamic> map) {
    return Administrador(
      id: map['id'] as String,
      nome: map['nome'] as String,
      email: map['email'] as String,
      telefone: map['telefone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Administrador.fromJson(String source) =>
      Administrador.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Administrador(id: $id, nome: $nome, email: $email, telefone: $telefone)';
  }

  @override
  bool operator ==(covariant Administrador other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.email == email &&
        other.telefone == telefone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ email.hashCode ^ telefone.hashCode;
  }
}
