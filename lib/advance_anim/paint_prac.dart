import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintPrac extends StatefulWidget{
  @override
  State<PaintPrac> createState()=> _PaintPracState();
}

class _PaintPracState extends State<PaintPrac>{

  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Practice', style: TextStyle(
            fontSize: 24,
            color: Colors.white
          )),
          backgroundColor: Colors.black54
        ),
      body: Container(
        height: height,
        width: width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              height: (height/5)*4,
              width: width,
              child: CustomPaint(
                painter: AnimPainter(),
                child: SizedBox(
                  height: (height/5)*4,
                  width: width
                )
              )
            )
          ]
        )
      )
    );
  }
}

class AnimPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint();
    paint
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    Path path = Path();
    final center = Offset(size.width/2, size.height/2);
    final radius = size.width/2;
    double angel = 142;
    final angels = List<double>.generate(6, (index)=>index*angel);

    path.moveTo(
      center.dx + radius*cos(0),
      center.dy + radius*cos(0)
    );

    for(double ang in angels){
      path.lineTo(
          center.dx+radius*cos(ang),
          center.dy+radius*sin(ang)
      );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}