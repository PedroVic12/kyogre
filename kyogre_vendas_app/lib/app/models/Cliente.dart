class Cliente {
  String nome;
  List<String> servicos;
  double preco;
  DateTime data;

  Cliente({
    required this.nome,
    required this.servicos,
    required this.preco,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'servicos': servicos,
      'preco': preco,
      'data': data.toIso8601String(),
    };
  }

  Object? toJson() {}



}
