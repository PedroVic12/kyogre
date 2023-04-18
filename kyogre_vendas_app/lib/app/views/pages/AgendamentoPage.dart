import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/controllers/AgendamentoController.dart';
import 'package:kyogre_vendas_app/app/models/Appoinment.dart';

class AgendamentoPage extends StatelessWidget {
  final AgendamentoController controller = Get.put(AgendamentoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDiaDaSemanaButton('Segunda'),
                _buildDiaDaSemanaButton('Terça'),
                _buildDiaDaSemanaButton('Quarta'),
                _buildDiaDaSemanaButton('Quinta'),
                _buildDiaDaSemanaButton('Sexta'),
                _buildDiaDaSemanaButton('Sábado'),
                _buildDiaDaSemanaButton('Domingo'),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Obx(() {
                if (controller.horarios.isEmpty) {
                  return Center(
                    child: Text('Nenhum horário disponível'),
                  );
                }

                return ListView.builder(
                  itemCount: controller.horarios.length,
                  itemBuilder: (context, index) {
                    final horario = controller.horarios[index];
                    return _buildHorarioButton(horario);
                  },
                );
              }),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (controller.horarioSelecionado.value.dia.isNotEmpty &&
                    controller.horarioSelecionado.value.hora.isNotEmpty) {
                  // Lógica para confirmar o agendamento
                  Get.snackbar(
                    'Agendamento confirmado',
                    'Seu agendamento foi marcado para ${controller.horarioSelecionado.value.hora} no dia ${controller.horarioSelecionado.value.dia}',
                    backgroundColor: Colors.green,
                  );
                } else {
                  Get.snackbar(
                    'Selecione um horário',
                    'Por favor, selecione um horário antes de confirmar o agendamento',
                    backgroundColor: Colors.red,
                  );
                }
              },
              child: Text('Confirmar agendamento'),
            ),



          ],
        ),
      ),
    );
  }

  Widget _buildDiaDaSemanaButton(String dia) {
    return ElevatedButton(
      onPressed: () {
        // Lógica para filtrar horários disponíveis para o dia selecionado
      },
      child: Text(dia),
    );
  }

  Widget _buildHorarioButton(String horario) {
    return ElevatedButton(
      onPressed: () {
        final diaSelecionado = ''; // Lógica para obter o dia selecionado
        controller.selecionarHorario(diaSelecionado, horario);
      },
      child: Text(horario),
    );
  }
}
