import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreativeAnim extends StatefulWidget{
  @override
  _CreativeAnim createState()=> _CreativeAnim();
}
class _CreativeAnim extends State<CreativeAnim> with SingleTickerProviderStateMixin{
  double boxWidth = 200;
  double startY = 0;
  double startX = 0;
  double endY = 170;
  double endX = 170;
  bool isFor = true;
  late Animation top;
  late Animation left;
  late AnimationController animCont;

  @override
  void initState(){
    super.initState();
    animCont = AnimationController(vsync: this, duration: Duration(seconds: 5));
    // top = Tween(begin: startY, end: endY).animate(animCont);
    left = Tween(begin: startX, end: endX).animate(animCont);
    animCont.forward();
    animCont.addListener((){
      setState((){

      });
    });
    Timer period = Timer.periodic(Duration(seconds: 5), (Timer period){
      if(isFor == true){
        animCont.forward();
        setState((){
          isFor = false;
        });
      }else{
        animCont.animateBack(0.0, duration: Duration(seconds: 5), curve: Curves.ease);
        setState((){
          isFor = true;
        });
      }
    });
  }
  animFunc(){
    if(left.value == 170){
      animCont.animateBack(0.0,duration: Duration(seconds: 5), curve: Curves.easeIn);
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Creative Animation', style: TextStyle(
          fontSize: 22,
          color: Colors.white
        )),
        backgroundColor: Colors.purple
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: boxWidth,
                    width: boxWidth,
                    color: Colors.red
                  ),
                  Positioned(
                    left: left.value,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue
                      )
                    )
                  )
                ]
              ),
              ElevatedButton(
                child:const Text('Anim', style: TextStyle(
                  fontSize: 22,
                  color: Colors.purple
                )),
                onPressed: (){
                  animFunc();
                }
              )
            ]
          )
        )
      )
    );
  }
}