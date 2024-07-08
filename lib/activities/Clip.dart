import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipCont extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Clip React', style: TextStyle(fontSize: 22, color: Colors.white)),
          backgroundColor: Colors.orange,
          iconTheme:const IconThemeData(
            color: Colors.white
          )
        ),
        body: Center(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/sunny.jpg', height: 100, width: 200, fit: BoxFit.fill)
            )
          )
        )
      );
  }
}