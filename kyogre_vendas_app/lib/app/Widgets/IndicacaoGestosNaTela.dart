import 'package:flutter/material.dart';

class GestosNavegacaoDaTela extends StatefulWidget {
  const GestosNavegacaoDaTela({Key? key}) : super(key: key);

  @override
  State<GestosNavegacaoDaTela> createState() => _GestosNavegacaoDaTelaState();
}

class _GestosNavegacaoDaTelaState extends State<GestosNavegacaoDaTela> {

  int contador_tela = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          setState(() {
            contador_tela++;
          });
        },
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(
            child: Text(contador_tela.toString(), style: const TextStyle(
              fontSize: 50
            ),),
          ),
        ),
      ),
    );
  }
}
