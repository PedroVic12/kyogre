import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/controllers/ModalController.dart';
import 'package:kyogre_vendas_app/app/controllers/ProdutoController.dart';
import 'package:kyogre_vendas_app/app/controllers/VendasController.dart';
import 'package:kyogre_vendas_app/app/models/Appoinment.dart';
import 'package:kyogre_vendas_app/app/views/pages/AddProduto.dart';
import 'package:kyogre_vendas_app/app/views/pages/AgendamentoPage.dart';
import 'package:kyogre_vendas_app/app/views/pages/HomePage.dart';

import 'app/controllers/ClienteController.dart';

void main() {
  // registra a instância da classe do ModalController no GetX
  Get.put(ModalController());

  // Instancia da Classe de Agendamento
  Get.put(Reserva());

  // Instancia da Classe de Produto
  Get.put(ProdutoController());

  // Registra VendasController no GetX
  Get.put(VendasController());

  // Instancia do controllador que vai receber as info do formulário
  Get.put(ClienteController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/addProduto': (context) => AdicionarVendaPage(),
      //   '/agendamento': (context) => AgendamentoPage(),
      // },
      home: HomePage(),
    );
  }
}
