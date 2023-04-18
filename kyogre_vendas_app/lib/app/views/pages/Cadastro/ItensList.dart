import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaDeVendas extends StatelessWidget {
  const ListaDeVendas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de vendas'),
      ),
      body: GetMaterialApp(

      ),
    );
  }
}
