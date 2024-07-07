import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget{
  @override
  _Details createState()=> _Details();
}
class _Details extends State<Details>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Details Page', style: TextStyle(fontSize: 22, color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme:const IconThemeData(
          color: Colors.white
        )
      ),
      body: SafeArea(
        child: Container(
          child: Hero(
            tag: 'sunny',
            child: Image.asset('assets/images/sunny.jpg')
          )
        )
      )
    );
  }
}