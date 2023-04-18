import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/controllers/NavigationController.dart';
import 'package:kyogre_vendas_app/app/views/pages/AgendamentoPage.dart';
import 'package:kyogre_vendas_app/app/views/pages/HomePage.dart';
import 'package:kyogre_vendas_app/app/views/ui/CartPage.dart';



class BarraNavegacaoWidget extends StatelessWidget {
  //const BarraNavegacaooWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarraNavegacao();
  }
}



final List<Widget> pages = [
  HomePage(),
  AgendamentoPage(),
  CartPage(),
];


class BarraNavegacao extends StatefulWidget {

  //Invocando o controller
  final NavigationController controller_navigator = Get.put(NavigationController());

  BarraNavegacao({Key? key}) : super(key: key);

  @override
  State<BarraNavegacao> createState() => _BarraNavegacaoState();
}

class _BarraNavegacaoState extends State<BarraNavegacao> {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: bottomNavController.selectedIndex.value,
        onTap: bottomNavController.changePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Pagina de Vendas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )),
    );

  }
}

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
