import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class CriarMesa extends StatefulWidget {
  @override
  _CriarMesaState createState() => _CriarMesaState();
}

class _CriarMesaState extends State<CriarMesa> {
  String getDiaMesAno() {
    String dia = DateTime.now().day.toString();
    String mes = DateTime.now().month.toString();
    String ano = DateTime.now().year.toString();
    String diamesano = (dia + '/' + mes + '/' + ano);
    return diamesano;
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //colocar aqui o input para o email do mestre
  TextEditingController nomeMesa = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criação de mesa"),),
      body: Column(
        children: <Widget>[
          _nomeMesa("Informe o nome"),
          _btnCriarMesa(),
        ],
      ),
    );
  }
  TextFormField _nomeMesa(String label) {
    return TextFormField(
//      textInputAction: TextInputAction.next,
      decoration:
      InputDecoration(labelText: label, border: OutlineInputBorder()),
      controller: nomeMesa,
      validator: (value) => value.isEmpty ? "Faltou aqui!" :  null,
    );
  }
  RaisedButton _btnCriarMesa() {
    return RaisedButton(
      child: Text("Concluir"),
      color: Colors.indigo,
      onPressed: () {
        Firestore.instance.collection("mesas").add({
          "titulo": nomeMesa.text,
          //"status": 1,
          //"dataAbertura": getDiaMesAno(),
        },
    );
  });
  }

}

//        if (formkey.currentState.validate()){
//          Firestore.instance.collection("mesas").add({
//            "titulo": nomeMesa.text,
//            "status": 1,
//            "dataAbertura": getDiaMesAno(),
//          }
//          );
//
//          Navigator.of(context).pop();
//        }*/