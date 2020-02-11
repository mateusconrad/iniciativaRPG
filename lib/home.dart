import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: <Widget>[
        TextField(
        enableSuggestions: true,
        showCursor: false,
        textAlign: TextAlign.start,
        style: TextStyle(decoration: TextDecoration.none),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
          focusColor: Colors.redAccent,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
          hintText: " Search for a workout",
          //hintStyle: klimeyFont.copyWith(letterSpacing: 1, fontSize: 14, textBaseline: TextBaseline.alphabetic),
          hasFloatingPlaceholder: true,
          contentPadding: EdgeInsets.only(
              top: 4, left: 10),
          icon: Container(
            child: IconTheme(
                data: IconThemeData(
                  color: Colors.redAccent,
                  opacity: 0.5,
                  size: 28,
                ),
                child: IconButton(
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.person_outline, semanticLabel: "Search Workouts"),
                  padding: EdgeInsets.only(bottom: 3),
                  alignment: Alignment.center,
                )
            ),
          ),),
        textInputAction: TextInputAction.search,
        //controller: textEditingController,
        onChanged: (textEditingController) {},
        onSubmitted: (textEditingController) {},
        )
        ],
      ),
    );
  }
}
