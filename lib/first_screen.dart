import 'dart:developer';

import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState();
  }

}

class FirstScreenState extends State<FirstScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            List<String> playerNames = ["Cristiano Ronaldo", "Lional Messi"];
            displayResult(context,playerNames);
          },
          child: Text("Select Best Football Player"),
        ),
      ),
    );
  }

  displayResult(BuildContext context, List<String> playerNames) async{
    final getSelectedPlayerName = await Navigator.pushNamed(context, "/SecondScreen", arguments: playerNames);
    print(getSelectedPlayerName.toString());
  }

}