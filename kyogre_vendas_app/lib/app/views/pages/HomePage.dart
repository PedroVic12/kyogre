import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayquaza_cadastro_app/app/Widgets/BarraNavegacao.dart';
import 'package:rayquaza_cadastro_app/app/Widgets/BarraPesquisa.dart';
import 'package:rayquaza_cadastro_app/app/Widgets/RefreshButton.dart';
import 'package:rayquaza_cadastro_app/app/controllers/ClienteController.dart';
import 'package:rayquaza_cadastro_app/app/controllers/ModalController.dart';
import 'package:rayquaza_cadastro_app/app/controllers/NavigationController.dart';
import 'package:rayquaza_cadastro_app/app/models/Appoinment.dart';
import 'package:rayquaza_cadastro_app/app/models/Service/Service.dart';
import 'package:rayquaza_cadastro_app/app/views/pages/AddProduto.dart';
import 'package:rayquaza_cadastro_app/app/views/pages/Agendamento/AgendarServicopage.dart';
import 'package:rayquaza_cadastro_app/app/views/pages/Agendamento/TelaConfirmacao.dart';
import 'package:rayquaza_cadastro_app/app/views/pages/AgendamentoPage.dart';
import 'package:rayquaza_cadastro_app/app/views/pages/ListaDeVendas.dart';
import 'package:rayquaza_cadastro_app/app/views/ui/CartPage.dart';

// 2::22 tutorial preciso fazer essa nova tela

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller de navegação
  final NavigationController controller = Get.put(NavigationController());

  // Controller do Modal Cliente para exibir na tela
  final clienteController = Get.find<ClienteController>();

  // Instanciando os objetos dos Models
  final services = [
    Service(name: 'Service 1', description: 'Description 1', price: 10.0),
    Service(name: 'Service 2', description: 'Description 2', price: 20.0)
  ];

  final appointment = Reserva();

  // Métodos
  void _addServicesToAppointment() {
    for (final service in services) {
      appointment.addService(service);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Center(child: Text('Aplicativo de Lista de Vendas')),
        backgroundColor: Colors.indigo[900],
      ),

      //! Barra de Navegação
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                const Text('Drawer Header'),
              ],
            )),

            //Itens
            ListTile(
                title: const Text('Pagina 1 - Agende sua consulta'),
                onTap: () {
                  Get.to(AgendamentoPage());
                }),

            ListTile(
                title: const Text('Pagina 2 - Debug'),
                onTap: () {
                  Get.to(const CartPage());
                }),

            ListTile(
              title: const Text('Pagina 3 - Tela de Confirmação'),
              onTap: () {
                Get.to(() => TelaConfirmacao());
              },
            ),

            ListTile(
              title: const Text('Pagina 4 - Agende um Serviço!'),
              onTap: () {
                Get.to(() => AgendarServicoPage());
              },
            ),

            ListTile(
              title: const Text('Pagina 5 - Lista de Vendas'),
              onTap: () {
                Get.to(() => const ListaDeVendas());
              },
            ),

          ],
        ),
      ),

      //! Botão de adicioanr venda (customizar)
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box_rounded),
        onPressed: () {
          Get.to(AdicionarVendaPage());
        },
      ),

      //! Barra de navegação Widget
      //!Barra normal criada na mão
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedPageIndex.value,
          // Mudança de Paginas
          onTap: controller.changePage,

          // Cor da barra
          backgroundColor: Colors.black26,

          // cor do item selecionado
          selectedItemColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(

                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.red),

            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Pagina de Vendas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: controller.selectedPageIndex.value,
          children: [
            //! Lista de Vendas
            Container(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.attach_money_rounded, size: 35,),
                    title: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Pedro'),
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('(0) Produtos - 31/03/2023 - 16:48'),
                      //child: Text('({servicos.lenght}) - {31/03/2023} - {16:48}'),

                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: AboutDialog(),
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem(
                          value: AboutDialog(),
                          child: Text('Cancelar'),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.attach_money_rounded),
                    title: const Text('Victor'),
                    trailing: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Get.find<ModalController>().MostrarOpcoesModal();
                        print('Abrindo Modal Opções');
                      },
                    ),
                  ),

                  Card(
                    color: Colors.deepOrange,
                    child: SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 50,
                        ),

                        //TODO Precisa criar um ListTile toda vez que adicionar um cliente novo

                        //TODO Exbir os atributos da classe no ListTile com a data criada

                        child: Obx(
                          () => clienteController.clientes.isEmpty
                              ? Center(child: Text("Nenhum cliente cadastrado"))
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: clienteController.clientes.length,
                                  itemBuilder: (context, index) {
                                    final cliente =
                                        clienteController.clientes[index];
                                    return ListTile(
                                      title: Text(cliente.nome),
                                      //subtitle: Text(cliente.servicos.join(", ")),
                                      subtitle: Text(
                                          cliente.preco.toStringAsFixed(2)),
                                      trailing:  PopupMenuButton(
                                        itemBuilder: (context) => [
                                          const PopupMenuItem(
                                            value: AboutDialog(),
                                            child: Text('Editar'),
                                          ),
                                          const PopupMenuItem(
                                            value: AboutDialog(),
                                            child: Text('Cancelar'),
                                          )
                                        ],
                                      ),
                                      onTap: (){
                                        Get.to(()=> ListaDeVendas());
                                      },
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.attach_money_rounded),
                    title: const Text('Veras'),
                    trailing: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Get.find<ModalController>().MostrarOpcoesModal();
                        print('Abrindo Modal Opções');
                      },
                    ),
                  ),

                  // Botão com uma funçao Async
                  const RefreshButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
