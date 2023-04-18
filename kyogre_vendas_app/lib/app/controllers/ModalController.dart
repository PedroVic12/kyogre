import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ModalController extends GetxController{
  void MostrarOpcoesModal() {

    Get.dialog(
      AlertDialog(
        title: const Text('MODAL -> Opções'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Editar'),
              onTap: () {
                // lógica para editar o item
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Excluir'),
              onTap: () {
                // lógica para excluir o item
                Get.back();
              },
            ),
          ],
        ),
      ),
      barrierDismissible: true,
    );
  }
}
