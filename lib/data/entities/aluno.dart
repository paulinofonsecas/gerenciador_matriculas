// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gerenciador_matriculas/data/entities/user.dart';

class Aluno extends User {
  String matricula;
  String curso;
  String classe;
  String turma;
  bool status;

  Aluno({
    required super.id,
    required super.nome,
    required super.email,
    required super.telefone,
    required this.matricula,
    required this.turma,
    required this.curso,
    required this.classe,
    required this.status,
  });

  Aluno copyWith({
    String? id,
    String? nome,
    String? email,
    String? matricula,
    String? turma,
    String? curso,
    String? classe,
    bool? status,
    String? telefone,
  }) {
    return Aluno(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      matricula: matricula ?? this.matricula,
      turma: turma ?? this.turma,
      curso: curso ?? this.curso,
      classe: classe ?? this.classe,
      status: status ?? this.status,
      telefone: telefone ?? this.telefone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'email': email,
      'matricula': matricula,
      'turma': turma,
      'curso': curso,
      'classe': classe,
      'status': status,
      'telefone': telefone,
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] as String,
      nome: map['nome'] as String,
      email: map['email'] as String,
      matricula: map['matricula'] as String,
      curso: map['curso'] as String,
      turma: map['turma'] as String,
      classe: map['classe'] as String,
      status: map['status'] as bool,
      telefone: map['telefone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) =>
      Aluno.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, email: $email, matricula: $matricula, turma: $turma, classe: $classe, status: $status, telefone: $telefone)';
  }

  @override
  bool operator ==(covariant Aluno other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.email == email &&
        other.matricula == matricula &&
        other.turma == turma &&
        other.classe == classe &&
        other.status == status &&
        other.telefone == telefone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        email.hashCode ^
        matricula.hashCode ^
        turma.hashCode ^
        classe.hashCode ^
        status.hashCode ^
        telefone.hashCode;
  }
}
