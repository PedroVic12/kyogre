// Controlador para o agendamento
import 'package:get/get.dart';
import 'package:rayquaza_cadastro_app/app/models/Service/Service.dart';
import '../models/Appoinment.dart';

class EventosController extends GetxController {
  final appointment = Reserva();

  void addService(Service service) {
    appointment.addService(service);
    update();
  }

  void removeService(Service service) {
    appointment.removeService(service);
    update();
  }
}