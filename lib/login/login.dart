import 'package:flutter/material.dart';
import 'package:flutter_app/home/mesas.dart';


class LoginMestre extends StatefulWidget {
  @override
  _LoginMestreState createState() => _LoginMestreState();
}

class _LoginMestreState extends State<LoginMestre> {
  TextEditingController nomeUsuario = TextEditingController();
  TextEditingController senhaUsuario = TextEditingController();
  var focusNomeUsuario = new FocusNode();
  var focusSenhaUsuario = new FocusNode();
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage(
                        "assets/images/fundologin.png",
                      ),
                      fit: BoxFit.fill))
          ),
          Form(
            key: _loginFormKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 150, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 150,),
                    Text("RPG Iniciativa",),
                    fieldUser(context),
                    Divider(endIndent: 15,),
                    fieldSenha(context),
                    SizedBox(height: 50,),
                    RaisedButton(
                      color: Colors.redAccent,
                      child: Text("Entrar"),
                      onPressed: (){
                        Navigator.pushReplacement(
                            context,MaterialPageRoute(
                                builder: (context) => ListaMesas()));
                      },
                      /*onPressed: (){
                        if (_loginFormKey.currentState.validate()) {
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: nomeUsuario.text,
                              password: senhaUsuario.text)
                              .then((currentUser) => Firestore.instance
                              .collection("users")
                              .document(currentUser.uid)
                              .get()
                              .then((DocumentSnapshot result) =>
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListaMesas())))
                              .catchError((err) => print(err)))
                              .catchError((err) => print(err));
                        }
                      },*/

                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  TextFormField fieldSenha(BuildContext context) {
    return TextFormField(
      focusNode: focusSenhaUsuario,
      obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: "Senha", icon: Icon(Icons.lock)),
      keyboardType: TextInputType.visiblePassword,
      controller: senhaUsuario,
      validator: (valor) {
        if (valor.isEmpty) {
          FocusScope.of(context).requestFocus(focusSenhaUsuario);
          return "Informe a senha";
        }
        return null;
      },
    );

  }
  TextFormField fieldUser(BuildContext context) {
    return TextFormField(
      decoration:
      InputDecoration(labelText: "Usuário", icon: Icon(Icons.people)),
      keyboardType: TextInputType.emailAddress,
      controller: nomeUsuario,
      autofocus: true,
      validator: (valor) {
        if (valor.isEmpty) {
          FocusScope.of(context).requestFocus(focusNomeUsuario);
          return "Informe o nome";
        }
        return null;
      },
    );
  }
}

