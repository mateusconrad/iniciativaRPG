import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollini/mesas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
          child: new Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 500,),
                   Container(padding: EdgeInsets.only(right: 25, left: 25),child: _textFieldLogin()),
                    MaterialButton(
                      color: Colors.teal,
                      child: Text("Só vem"),
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mesas()));
                      },
                    ),
                    SizedBox(height: 50,),
                  ],

          ),
            ),
    ));
  }
// image: AssetImage("assets/wallpaper.jpg"),
  TextField _textFieldLogin() {
    return TextField(
      textAlign: TextAlign.start,
      style: TextStyle(decoration: TextDecoration.none),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusColor: Colors.white,
        border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: "Cai pro fight nerd fedido",
        //hintStyle: klimeyFont.copyWith(letterSpacing: 1, fontSize: 14, textBaseline: TextBaseline.alphabetic),
        hasFloatingPlaceholder: true,
        contentPadding: EdgeInsets.only(top: 4, left: 10),

      ),
      textInputAction: TextInputAction.search,
      //controller: textEditingController,
      onChanged: (textEditingController) {},
      onSubmitted: (textEditingController) {},
    );
  }
}
