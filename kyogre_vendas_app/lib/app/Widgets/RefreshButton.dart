import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  const RefreshButton({Key? key}) : super(key: key);

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {

  //Async Function
  Future<String> buscarItensDatabase() async{
    await Future.delayed(const Duration(seconds: 2));

    //throw 'Error';
    return 'Super!';
  }


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: FutureBuilder(
        future: buscarItensDatabase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }

          //tratamento de erro
          if (snapshot.hasError){
            return Text(snapshot.error.toString());
          } else {
            return Column(
              children: [
                Text(snapshot.data.toString()),
                ElevatedButton(onPressed: (){
                  setState(() {});
                }, child: const Text('Refresh Button'))
              ],
            );
          }
        },
      ),
    );
  }
}
