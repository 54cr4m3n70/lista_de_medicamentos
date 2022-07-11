import 'dart:convert';

class Medicamento {
  int id;
  String nome;
  String descricao;
  Medicamento({
    required this.id,
    required this.nome,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory Medicamento.fromMap(Map<String, dynamic> map) {
    return Medicamento(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicamento.fromJson(String source) =>
      Medicamento.fromMap(json.decode(source));
}
