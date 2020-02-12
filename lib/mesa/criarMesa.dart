
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CriarMesa extends StatefulWidget {
  @override
  _CriarMesaState createState() => _CriarMesaState();
}

class _CriarMesaState extends State<CriarMesa> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nomeMesa = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {
      initUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    //Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();
    return Scaffold(
      appBar: AppBar(
        title: Text("Criação de mesa"),
      ),
      body: Column(
        children: <Widget>[
          _formNomeMesa(),
          _btnCriarMesa(),
        ],
      ),
    );
  }

  Form _formNomeMesa() {
    return Form(
      key: formkey,
      child: _nomeMesa("Informe o nome"),
    );
  }

  TextFormField _nomeMesa(String label) {
    return TextFormField(
//      textInputAction: TextInputAction.next,
      decoration:
          InputDecoration(labelText: label, border: OutlineInputBorder()),
      controller: nomeMesa,
      validator: (value) => value.isEmpty ? "Faltou aqui!" : null,
    );
  }

  RaisedButton _btnCriarMesa() {
    return RaisedButton(
        child: Text("Concluir"),
        color: Colors.indigo,
        onPressed: () {
          if (formkey.currentState.validate()) {
            Firestore.instance.collection("mesas").add(
              {
                "nome": nomeMesa.text,
                "status": '1',
                "dataCriacao": getDiaMesAno(),
                "horaCriacao": getHoraMinuto(),
                "emailCriador": "${user?.email}"
              },
            );
            Navigator.pop(context);
          }
        });
  }

  String getDiaMesAno() {
    String dia = DateTime.now().day.toString();
    String mes = DateTime.now().month.toString();
    String ano = DateTime.now().year.toString();
    String diamesano = (dia + '/' + mes + '/' + ano);
    return diamesano;
  }

  String getHoraMinuto() {
    String hora = DateTime.now().hour.toString();
    String minuto = DateTime.now().minute.toString();

    String horaChamado = (hora + ':' + minuto);

    return horaChamado;
  }
}
