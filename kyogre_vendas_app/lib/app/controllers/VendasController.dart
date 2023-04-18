import 'package:get/get.dart';
import 'package:rayquaza_cadastro_app/app/models/Vendas.dart';

class VendasController extends GetxController {
  List<Vendas> itensVenda = <Vendas>[
    Vendas(
      nome_venda: 'Produto 1',
      data: '10/04/2023',
      preco: 50,
      servicos: ['Corte de Cabelo', 'Escova'],
      vendido: false,
    ),
    Vendas(
      nome_venda: 'Produto 2',
      data: '10/04/2023',
      preco: 100,
      servicos: ['Corte de Cabelo', 'Escova'],
      vendido: false,
    ),
    Vendas(
      nome_venda: 'Produto 3',
      data: '10/04/2023',
      preco: 150,
      servicos: ['Corte de Cabelo', 'Escova'],
      vendido: false,
    ),
  ].obs;

//Estude a API funcional do Dart, que inclui funções como map, where, fold, reduce e forEach.
  double get precoTotal => itensVenda
      .where((venda) => venda.vendido)
      .fold(0, (previousValue, venda) => previousValue + venda.preco);

  double get subtotal => itensVenda
      .where((venda) => venda.vendido)
      .fold(0, (previousValue, venda) => previousValue + venda.preco);

  int get vendidos => itensVenda.where((venda) => venda.vendido).length;
}
