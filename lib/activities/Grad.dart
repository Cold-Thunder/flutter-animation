import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grad extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient Colors', style: TextStyle(fontSize: 22, color: Colors.white)),
        iconTheme:const IconThemeData(

        )
      ),
      body: Center(
        child: Container(
          
        )
      )
    );
  }
}