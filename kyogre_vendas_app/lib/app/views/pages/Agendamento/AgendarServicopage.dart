import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/models/Appoinment.dart';
import 'package:kyogre_vendas_app/app/models/Service/Service.dart';

class AgendarServicoPage extends StatelessWidget {


// Instanciando os objetos dos Models
  final services = [Service(name: 'Service 1', description: 'Description 1', price: 10.0), Service(name: 'Service 2', description: 'Description 2', price: 20.0)];
  final appointment = Reserva();

  // Métodos
  void _addServicesToAppointment() {
    for (final service in services) {
      appointment.addService(service);
    }
  }

   AgendarServicoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Pagina de Serviços'),
      ),
      body: Column(
        children: [
          Text('Selecione o serviço desejado:'),
          SizedBox(height: 10),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                shrinkWrap: true,
                itemCount: Get.find<Reserva>().services.length,
                itemBuilder: (context, index) {
                  final service = Get.find<Reserva>().services[index];
                  return ListTile(
                    title: Text(service.name),
                    subtitle: Text(service.description),
                    trailing: Switch(
                      value: service.selected.value,
                      onChanged: (value) {
                        service.selected.toggle();
                      },
                    ),
                  );

                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Agendar'),
          ),
        ],
      ),
    );
  }
}

