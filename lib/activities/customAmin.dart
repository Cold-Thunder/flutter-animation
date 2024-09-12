import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAnim extends StatefulWidget{
  @override
  _CustomAnim createState()=> _CustomAnim();
}
class _CustomAnim extends State<CustomAnim>{
  late double _dx;
  late double _dy;
  late double _x = 0.0;
  late double _y = 0.0;
  late double _wid;
  late double _hei;
  late double _rangeX;
  late double _rangeY;
  @override
  void initState(){
    super.initState();
    _dx = Random().nextDouble()*250;
    _dy = Random().nextDouble()*250;

  }
  @override
  Widget build(BuildContext context){
    _wid = MediaQuery.of(context).size.width;
    _hei = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Anim', style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        )),
        backgroundColor: Colors.purple
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                width: _wid,
                height: _hei,
                color: Colors.blue
              ),
              Positioned(
                top: _dy,
                left: _dx,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25)
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}