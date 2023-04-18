import 'package:get/get.dart';

class Service {
  String name;
  String description;
  double price;


  RxBool selected = false.obs;// Bool observavel usando getx

  Service({required this.name, required this.description, required this.price});
}
