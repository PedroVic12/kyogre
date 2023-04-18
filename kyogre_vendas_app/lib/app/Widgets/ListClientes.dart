import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewClientes extends StatelessWidget {
  const ListViewClientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.attach_money_rounded),
          title: Text('text'),

        ),

      ],
    );
  }
}
