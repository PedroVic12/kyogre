import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/Widgets/BarraInferior.dart';
import 'package:kyogre_vendas_app/app/Widgets/BarraPesquisa.dart';
import 'package:kyogre_vendas_app/app/controllers/VendasController.dart';
import 'package:kyogre_vendas_app/app/models/Produto.dart';
import 'package:kyogre_vendas_app/app/models/Vendas.dart';

class ListaDeVendas extends StatefulWidget {
  const ListaDeVendas({Key? key}) : super(key: key);

  @override
  State<ListaDeVendas> createState() => _ListaDeVendasState();
}

class _ListaDeVendasState extends State<ListaDeVendas> {
  final VendasController vendasController = Get.put(VendasController());
  //final VendasController vendasController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Exibindo na tela
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Vendas'),
      ),
      bottomNavigationBar: BarraInferior(
          itensVenda: vendasController.itensVenda,
          precoTotal: vendasController.precoTotal,
          vendidos: vendasController.itensVenda.length),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(right: 200, top: 10),
              child: Text(
                'Cliente: Pedro Victor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(12),
              child: SearchBar(
                onChanged: (value) {
                  setState(() {
                    vendasController.itensVenda = vendasController.itensVenda
                        .where((element) =>
                            element.nome_venda.toLowerCase().contains(value))
                        .toList();
                  });
                },
              ),
            ),

            ElevatedButton(
                onPressed: () {}, child: const Icon(Icons.add_circle_rounded)),

            // Exibindo a lista de vendas
            Container(
              child: Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  // Instanciando o objeto para acessar seus atributos
                  Vendas venda_cliente;

                  // Verificando se o índice é válido
                  if (index < vendasController.itensVenda.length) {
                    venda_cliente = vendasController.itensVenda[index];

                    // Exibindo na tela
                    return ListTile(
                        title: Text(venda_cliente.nome_venda),
                        subtitle: Text(venda_cliente.preco.toString()),
                        trailing: Checkbox(
                          value: venda_cliente.vendido,
                          onChanged: (bool? value) {
                            setState(() {
                              venda_cliente.vendido = value!;
                            });
                          },
                        ));
                  } else {
                    // índice inválido, fazer algo aqui (como lançar uma exceção)
                    print('Erro ao buscar');
                  }
                }),
              ),
            ),

            Dismissible(
                key: UniqueKey(), child: const Text('Deslize para apagar'))
          ],
        ),
      ),
    );
  }
}

//! Teste controller baseado no video
class MyController extends GetxController {
  final items = <Produto>[
    Produto(
        nome: 'Cafe com Leite',
        descricao: 'gosto e simples',
        preco: 18,
        data: DateTime.now(),
        quantidade: 2),
  ].obs;

  final searchText = ''.obs;

  MyController() {
    // Inicializa a lista com a data atual
    items.add(Produto(
        nome: 'Produto com data atual',
        descricao: 'Descrição',
        preco: 20,
        data: DateTime.now(),
        quantidade: 1));
  }

  void filter(String value) {
    searchText.value = value;
  }

  void setChecked(int index, bool value) {
    //items[index].isChecked.value = value;
  }

  List<Produto> get filteredItems {
    if (searchText.isEmpty) {
      return items;
    } else {
      return items
          .where((item) =>
              item.nome.toLowerCase().contains(searchText.value.toLowerCase()))
          .toList();
    }
  }
}
