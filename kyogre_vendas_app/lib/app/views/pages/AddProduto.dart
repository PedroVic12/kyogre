import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyogre_vendas_app/app/controllers/ClienteController.dart';

class AdicionarVendaPage extends StatelessWidget {
  final ClienteController controller_cliente = Get.put(ClienteController());

  AdicionarVendaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Novo cliente')),
      body: Card(
        color: Colors.white38,
        child: Form(
          child: Column(
            children: [
              Text(
                'Nova Venda',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do Cliente'),
                  onChanged: controller_cliente.atualizaNome,
                  //validator: (value) => value?.isEmpty ?? 'Campo obrigatório',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selecione os Serviços'),
                    DropdownButtonFormField(
                      isExpanded: true,
                      items: controller_cliente.opcoesServicos
                          .map((servico) => DropdownMenuItem(
                        value: servico,
                        child: Text(servico),
                      ))
                          .toList(),
                      onChanged: (servico) {
                        if (servico != null) {
                          controller_cliente.adicionaServico(servico);
                        }
                      },
                      value: null,
                    ),

                    Wrap(
                      children: controller_cliente.servicos
                          .map((servico) => Chip(
                        label: Text(servico),
                        onDeleted: () =>
                            controller_cliente.removeServico(controller_cliente.servicos.indexOf(servico)),
                      ))
                          .toList(),
                    ),
                  ],
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount: controller_cliente.servicos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(controller_cliente.servicos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => controller_cliente.removeServico(index),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Valor'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller_cliente
                      .atualizaPreco(double.tryParse(value) ?? 0.0),
                ),
              ),

              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {
                    print('Clicou no checkbox');
                  },),
                  
                  Text('Ja esta adicionado?')
                ],
              ),

              
              //Padding(
              //padding: const EdgeInsets.all(8.0),
              //child: TextFormField(
              //decoration: InputDecoration(labelText: 'Data'),
              //keyboardType: TextInputType.datetime,
              //onChanged: (value) => controller_cliente
              //      .atualizaData(DateTime.tryParse(value) ?? DateTime.now()),
              //),
              //),

              //! Botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Adicionar'),
                      onPressed: () {
                        controller_cliente.adicionarCliente();
                        print('Salvando os dados');
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background
                        onPrimary: Colors.white, // foreground
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      //controller.salvarCliente();
                      print('Refazendo o formulario');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
