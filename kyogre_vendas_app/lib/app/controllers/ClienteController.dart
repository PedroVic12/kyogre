import 'dart:convert';

import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:kyogre_vendas_app/app/controllers/ProdutoController.dart';
import 'package:kyogre_vendas_app/app/models/Cliente.dart';
import 'package:kyogre_vendas_app/app/models/Produto.dart';
import 'package:http/http.dart' as http;

final db = Db('mongodb://localhost:27017/meu_banco_de_dados');

class ClienteController extends GetxController {
  // Instanciando o Controller do Produto
  final ProdutoController produtoController = Get.find<ProdutoController>();

  final clientes = <Cliente>[].obs;

  final nome = ''.obs;
  final servicos = <String>[].obs;
  final preco = 0.0.obs;
  final data = DateTime.now().obs;

  // Métodos Backend
  Future<Map<String, dynamic>> criarCliente(Cliente cliente) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/clientes'),
      body: json.encode(cliente.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao criar cliente');
    }
  }

  // Opções
  final opcoesServicos = [
    'Corte de cabelo',
    'Pintura de cabelo',
    'Manicure',
    'Pedicure',
    'Depilação',
    'Massagem',
    'Limpeza de pele',
    'Outros',
  ];

  // Métodos
  void adicionarCliente() {
    final novoCliente = Cliente(
      nome: nome.value,
      servicos: servicos.toList(),
      preco: preco.value,
      data: data.value,
    );
    clientes.add(novoCliente);
    nome.value = '';
    servicos.clear();
    preco.value = 0.0;
    data.value = DateTime.now();
  }

  List<Cliente> get listaClientes => clientes.toList();

  //ChatGPT

  void atualizaNome(String value) => nome.value = value;

  void adicionaServico(String value) {
    if (value.isNotEmpty) {
      servicos.add(value);
    }
  }

  void removeServico(int index) => servicos.removeAt(index);

  void atualizaPreco(double value) => preco.value = value;

  void atualizaData(DateTime value) => data.value = value;

  void salvarCliente() {
    produtoController.salvarProduto();
    Get.back();
  }

  void salvarClienteBanco() async {
    final cliente = Cliente(
      nome: nome.value,
      servicos: servicos,
      preco: preco.value,
      data: data.value,
    );
  }

  void buscarClientes() async {
    await db.open();
    final colecao = db.collection('clientes');
    final cursor = await colecao.find();
    //clientes.value = await cursor.map((doc) => Cliente.fromMap(doc)).toList();
    await db.close();
  }
}
