import 'package:flutter/material.dart';
import 'package:rollini/criarMesa.dart';
import 'package:rollini/listaMesas.dart';

class Mesas extends StatefulWidget {
  @override
  _MesasState createState() => _MesasState();
}

class _MesasState extends State<Mesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListaMesas(),
      floatingActionButton: _adicionaMesa(),
      drawer: Drawer(),
    );
  }

  FloatingActionButton _adicionaMesa() {
    return FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text("Mesa"),
      backgroundColor: Colors.blue,
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CriarMesa()));
      },

    );
  }

  AppBar _appBar() => AppBar(

  );


}
