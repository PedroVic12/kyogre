import 'package:get/get.dart';
import 'package:rayquaza_cadastro_app/app/models/Service/Service.dart';

class Reserva {
  final services = <Service>[].obs;

  void addService(Service service) {
    services.add(service);
  }

  void removeService(Service service) {
    services.remove(service);
  }

  double get totalPrice => services.fold(0.0, (previousValue, service) => previousValue + service.price);
}
