import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/activities/Clip.dart';
import 'package:flutter_animation/activities/RippleEffect.dart';
import 'package:flutter_animation/activities/Tiles.dart';
import 'package:flutter_animation/activities/TweenAnim.dart';
import 'package:flutter_animation/activities/WheelList.dart';

class Myhomepage extends StatefulWidget{
  @override
  _Myhomepage createState()=>_Myhomepage();
}

class _Myhomepage extends State<Myhomepage>{
  var _width = 100.0;
  var _height = 100.0;
  var _myOp = 1.0;
  bool _tog = false;
  bool _togOp = false;
  Decoration myDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.blue,
  );
  anim(){
    if(_tog == false) {
      setState(() {
        _width = 300;
        _height = 300;
        _tog = true;
        myDecoration = BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: Colors.red,
        );
      });
    }else{
      setState((){
        _width= 100;
        _height = 100;
        _tog = false;
        myDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue
        );
      });
    }
  }
  optAnim(){
    if(_togOp == false){
      setState((){
      _myOp = 0;
      _width= 0;
      _togOp = true;
    });
    }else{
      setState((){
        _myOp = 1;
        _width = 100;
        _togOp = false;
      });
    }

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Animation', style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold
        )),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _myOp,
                duration: Duration(seconds: 2),
                curve: Curves.bounceOut,
              child: AnimatedContainer(
                height: _height,
                width: _width,
                curve: Curves.bounceOut,
                decoration: myDecoration,
                duration: Duration(seconds: 2)
              )),
              ElevatedButton(
                child: const Text('Animated', style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){
                  anim();
                }
              ),
              ElevatedButton(
                child: const Text('Close', style: TextStyle(fontSize:22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){
                  optAnim();
                }
              ),
              ElevatedButton(
                child: const Text('Go to tiles', style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Tiles())
                  );
                }
              ),
              ElevatedButton(
                child: const Text('Go to Wheel', style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Wheel())
                  );
                }
              ),
              ElevatedButton(
                child: const Text('Go to Clip', style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed:(){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ClipCont())
                  );
                }
              ),
              ElevatedButton(
                child: const Text('Go to Tween', style: TextStyle(fontSize: 22, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>TweenAnim())
                  );
                }
              ),
              ElevatedButton(
                  child: const Text('Go to Ripple', style: TextStyle(fontSize: 22, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>RippleEffect())
                    );
                  }
              )
            ]
          )
        )
      )
    );
  }
}