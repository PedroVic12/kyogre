import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/models/Vendas.dart';

class BarraInferior extends StatelessWidget {
  final List<Vendas> itensVenda;
  final double precoTotal;
  final int vendidos;

  const BarraInferior({
    Key? key,
    required this.itensVenda,
    required this.precoTotal,
    required this.vendidos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double subtotal = itensVenda.fold(
        0, (previousValue, venda) => previousValue + venda.preco);

    double total = itensVenda.fold(
        0, (previousValue, venda) => previousValue + venda.preco);

    return BottomAppBar(
      color: Colors.blue,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart, color: Colors.white),
                    const SizedBox(height: 5),
                    Text(
                      'Produtos: ${itensVenda.length}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.white),
                    const SizedBox(height: 5),
                    Text(
                      'Vendidos: ${itensVenda.where((venda) => venda.vendido).length}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Subtotal:',
                      style: TextStyle(color: Colors.white)),
                  Text(
                    'R\$ ${subtotal.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: const Text('Total:',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Text(
                    'R\$ ${precoTotal.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
