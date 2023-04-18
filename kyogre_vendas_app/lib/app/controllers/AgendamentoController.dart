import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/models/Horarios.dart';

class AgendamentoController extends GetxController {
  final horarios = <String>[].obs;
  var horarioSelecionado = Horario(dia: '', hora: '').obs;

  @override
  void onInit() {
    super.onInit();
    horarios.addAll(['10:00', '11:00', '12:00', '14:00', '15:00', '16:00']);
  }

  void selecionarHorario(String dia, String hora) {
    horarioSelecionado.value = Horario(dia: dia, hora: hora);
  }
// Outros atributos e métodos aqui
}
