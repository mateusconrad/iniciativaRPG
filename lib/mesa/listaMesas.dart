import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListaMesas extends StatefulWidget {
  @override
  _ListaMesasState createState() => _ListaMesasState();
}

class _ListaMesasState extends State<ListaMesas> {
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
    // Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: StreamBuilder(

                stream: Firestore.instance
                    .collection("mesas")
                    .where("status", isEqualTo: '1').where("nomeCriador", isEqualTo: "${user?.email}")
                    //.orderBy("titulo", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.done:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.data.documents.length == 0) {
                        return Center(
                          child: Text(
                            "Não há mesas, Vá jogar!",
                            style:TextStyle(color: Colors.redAccent, fontSize: 20),
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
                          itemBuilder: (context, index) {
                            return Card(
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                          snapshot
                                              .data.documents[index].data["nome"],
                                          style: TextStyle(fontSize: 25)),
                                      /*subtitle: Text(
                                        snapshot
                                            .data.documents[index].data["prioridade"],
                                      ),*/
                                    ),

                                  ],
                                ));
                          });
                  }
                })
        )
      ],
    );
  }
}
