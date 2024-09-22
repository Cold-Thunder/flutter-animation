import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawer3d extends StatefulWidget{
  @override
  State<Drawer3d> createState()=> _Drawer3d();
}

class _Drawer3d extends State<Drawer3d>{
  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Drawer', style: TextStyle(
          fontSize: 24,
          color: Colors.white
        )),
        backgroundColor: Colors.black54
      ),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: Colors.grey,
          child: Column(
            children: [

            ]
          )
        )
      )
    );
  }
}