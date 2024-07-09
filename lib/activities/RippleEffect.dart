import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RippleEffect extends StatefulWidget{
  @override
  _RippleEffect createState()=> _RippleEffect();
}

class _RippleEffect extends State<RippleEffect> with SingleTickerProviderStateMixin{
  late AnimationController _animCont;
  var rad = [30, 40, 50, 60, 70];

  @override
  void initState(){
    super.initState();
    _animCont = AnimationController(vsync: this, duration: Duration(seconds: 2), lowerBound: 0.5);
    _animCont.addListener((){
      setState((){

      });
    });
    // _animCont.forward();
  }

  void showRipple(){
    _animCont.forward();
    const tim = Duration(seconds: 2);
    Timer(tim, (){
      _animCont.animateBack(0.0, duration: Duration(seconds: 1), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ripple Effect', style: TextStyle(fontSize: 22, color: Colors.white)),
        backgroundColor: Colors.pink,
        iconTheme: const IconThemeData(color: Colors.white)
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                child: Stack(
            alignment: Alignment.center,
            children:
             [
                myWidget(rad[0], _animCont.value),
                myWidget(rad[1], _animCont.value),
                myWidget(rad[2], _animCont.value),
               myWidget(rad[3], _animCont.value),
               myWidget(rad[4], _animCont.value),

               InkWell(
                 onTap: (){
                   showRipple();
                 },
                 child: Icon(Icons.phone, color: Colors.orange, size: 50),
               )
             ]
          )),
              Container(
                child: ElevatedButton(
                  child: Text('Show Ripple', style: TextStyle(fontSize: 22, color: Colors.white)),
                  onPressed: (){
                    showRipple();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
                )
              )
            ],
          )
        )
      )
    );
  }
}

Widget myWidget(ra, anim){
  return Container(
      height: ra*anim,
      width: ra*anim,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(1.0 - anim)
      )
  );
}