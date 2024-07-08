import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wheel extends StatelessWidget{
  var items = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Wheel List', style: TextStyle(fontSize: 22, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
        iconTheme:const IconThemeData(
          color: Colors.white
        )
      ),
      body: Center(
        child: Container(
          child: ListWheelScrollView(
            itemExtent: 500,
            children: items.map((item){
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: double.infinity,
                height: 150,
                child: Text('$item', style:const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ))
              );
            }).toList()
          )
        )
      )
    );
  }
}