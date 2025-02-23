// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlunoParams {
  final String nome;
  final String matricula;
  final String curso;
  final String classe;
  final String turma;
  final String telefone;

  AlunoParams({
    this.nome = '',
    this.matricula = '',
    this.curso = '',
    this.classe = '',
    this.turma = '',
    this.telefone = '',
  });

  AlunoParams copyWith({
    String? nome,
    String? matricula,
    String? curso,
    String? classe,
    String? turma,
    String? telefone,
  }) {
    return AlunoParams(
      nome: nome ?? this.nome,
      matricula: matricula ?? this.matricula,
      curso: curso ?? this.curso,
      classe: classe ?? this.classe,
      turma: turma ?? this.turma,
      telefone: telefone ?? this.telefone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'matricula': matricula,
      'curso': curso,
      'classe': classe,
      'turma': turma,
      'telefone': telefone,
    };
  }

  factory AlunoParams.fromMap(Map<String, dynamic> map) {
    return AlunoParams(
      nome: map['nome'] as String,
      matricula: map['matricula'] as String,
      curso: map['curso'] as String,
      classe: map['classe'] as String,
      turma: map['turma'] as String,
      telefone: map['telefone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlunoParams.fromJson(String source) =>
      AlunoParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AlunoParams(nome: $nome, matricula: $matricula, curso: $curso, classe: $classe, turma: $turma, telefone: $telefone)';
  }

  @override
  bool operator ==(covariant AlunoParams other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.matricula == matricula &&
        other.curso == curso &&
        other.classe == classe &&
        other.turma == turma &&
        other.telefone == telefone;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        matricula.hashCode ^
        curso.hashCode ^
        classe.hashCode ^
        turma.hashCode ^
        telefone.hashCode;
  }
}
