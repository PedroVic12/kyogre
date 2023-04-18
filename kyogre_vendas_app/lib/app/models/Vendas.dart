class Vendas {
  String nome_venda;
  double preco;
  bool vendido;
  String data;
  List servicos;

  Vendas(
      {required this.nome_venda,
      required this.preco,
      required this.vendido,
      required this.data,
      required this.servicos});
}
