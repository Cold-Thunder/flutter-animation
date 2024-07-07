import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/activities/Details.dart';

class Tiles extends StatefulWidget{
  @override
  _Tiles createState()=> _Tiles();
}

class _Tiles extends State<Tiles>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title:const Text('Hero Widget', style: TextStyle(fontSize: 22, color: Colors.white)),
          backgroundColor: Colors.green,
          iconTheme: const IconThemeData(
            color: Colors.white,
          )
        ),
      body: SafeArea(
        child: Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> Details())
              );
            },
          child: Hero(
            tag: 'sunny',
            child: Image.asset('assets/images/sunny.jpg', width: 100, height: 100)
          ))
        )
      )
    );
  }
}