import 'package:get/get.dart';
import 'package:rayquaza_cadastro_app/app/models/Produto.dart';

class ProdutoController extends GetxController {
  final Produto _produto = Produto(nome: 'Produto X', descricao: 'Descrição do Produto X', preco: 10.99, data: DateTime.now(), quantidade: 5);

  String get nome => _produto.nome;
  set nome(String value) => _produto.nome = value;

  double get preco => _produto.preco;
  set preco(double value) => _produto.preco = value;

  int get quantidade => _produto.quantidade;
  set quantidade(int value) => _produto.quantidade = value;

  void salvarProduto() {
    print('Nome do produto: $nome');
    print('Preço do produto: $preco');
    print('Quantidade do produto: $quantidade');

    // final dataBase = DataBaseExcel('path/to/credentials.json', 'SPREADSHEET_ID', 'Sheet1');
    // await dataBase.salvarProduto('Produto A', 'Descrição do Produto A', 10.5, 50);

  }
}
