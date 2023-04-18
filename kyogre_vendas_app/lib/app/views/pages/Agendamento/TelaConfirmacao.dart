import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/controllers/EventosController.dart';
import 'package:kyogre_vendas_app/app/models/Appoinment.dart';
import 'package:kyogre_vendas_app/app/models/Service/Service.dart';

// Página para o agendamento
class TelaConfirmacao extends StatelessWidget {
  final controller = Get.put(EventosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agendamento de Clientes')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Serviços selecionados:',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.appointment.services.length,
              itemBuilder: (context, index) {
                final service = controller.appointment.services[index];
                return ListTile(
                  title: Text(service.name),
                  subtitle: Text(service.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => controller.removeService(service),
                  ),
                );
              },
            )),
          ),
          Text(
            'Total: \$${controller.appointment.totalPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
