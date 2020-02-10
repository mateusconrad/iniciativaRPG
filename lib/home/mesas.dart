import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaMesas extends StatefulWidget {
  @override
  _ListaMesasState createState() => _ListaMesasState();
}

class _ListaMesasState extends State<ListaMesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (Text("Mesas")),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("chamados")
                      .where("status", isEqualTo: 3)
                      .orderBy("titulo", descending: false)
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
                              "Não há dados!",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 20),
                            ),
                          );
                        }
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            padding: EdgeInsets.only(
                                top: 5, left: 5, right: 5, bottom: 10),
                            itemBuilder: (context, index) {
                              return Card(
                                  child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                        snapshot.data.documents[index]
                                            .data["titulo"],
                                        style: TextStyle(fontSize: 25)),
                                    subtitle: Text(
                                      snapshot.data.documents[index]
                                          .data["prioridade"],
                                    ),
                                  ),
                                  ButtonBarTheme(
                                    child: ButtonBar(
                                      children: <Widget>[
                                        OutlineButton(
                                            child: const Text('Finalizar'),
                                            onPressed: () {}),
                                        OutlineButton(
                                            child: const Text('Pausar'),
                                            onPressed: () {}),
                                        IconButton(
                                            icon: Icon(Icons.info),
                                            onPressed: () {}),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                            });
                    }
                  }),
            ),
          ],
        ));
  }
}
