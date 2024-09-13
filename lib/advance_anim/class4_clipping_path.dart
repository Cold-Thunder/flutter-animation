import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/activities/clippath_pac.dart';
import 'dart:math' as math;

class ClippingPath extends StatefulWidget{
  @override
  State<ClippingPath> createState()=> _ClippingPathState();
}

class _Clipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();

    final rect = Rect.fromCircle(
        center: Offset(size.height/2, size.width/2),
        radius: size.width/2
    );
    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Color? colorGeneraor ()=> Color(0xFF000000 + math.Random().nextInt(0x00FFFFFF));

class _ClippingPathState extends State<ClippingPath>{
  var _color = colorGeneraor();
  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Class 4', style: TextStyle(
          fontSize: 24,
          color: Colors.white
        )),
        backgroundColor: Colors.black54
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ClipPath(
                clipper: _Clipper(),
                child: TweenAnimationBuilder(
                    tween: ColorTween(
                      begin: colorGeneraor(),
                      end: _color,
                    ),
                    onEnd: (){
                      setState((){
                        _color = colorGeneraor();
                      });
                    },
                    duration: const Duration(seconds: 1),
                    builder: (context, Color? color, child){
                      return
                        ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              color!,
                              BlendMode.srcATop
                            ),
                        child: Container(
                          height: width,
                          width: width,
                          color: Colors.yellow
                      ));
                    }
                )
              )
            ]
          )
        )
      )
    );
  }
}