import 'dart:math';
import 'package:flutter/material.dart';

class CustomPaintClass extends StatefulWidget{
  const CustomPaintClass({super.key});
  @override
  State<CustomPaintClass> createState()=> _StateCustomPaintClass();
}

class _StateCustomPaintClass extends State<CustomPaintClass> with TickerProviderStateMixin{

  late Animation _animRot;
  late AnimationController _animContRot;

  late Animation _animScale;
  late AnimationController _animScaleCont;

  @override
  void initState(){
    super.initState();
    try{
      _animContRot =  AnimationController(vsync: this, duration: const Duration(seconds: 2));
      _animRot = Tween(begin: 0.0, end: 2*pi).animate(_animContRot);
      _animContRot.forward();
      _animContRot.repeat();

      _animScaleCont = AnimationController(vsync: this, duration: const Duration(seconds: 2));
      _animScale = Tween(begin: 0.0, end: 1).animate(
        CurvedAnimation(
          parent: _animScaleCont,
          curve: Curves.bounceInOut
        )
      );
      _animScaleCont.forward();
      _animScaleCont.repeat(reverse: true);
    }catch(err){
      print(err);
    }
  }

  @override
  void dispose(){
    _animContRot.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Paint',style:TextStyle(
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
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                        animation: Listenable.merge([
                          _animContRot,
                          _animScaleCont
                        ]),
                        builder: (context, child){
                          return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setRotationZ(_animRot.value)
                                ..setRotationX(_animRot.value)
                                ..setRotationY(_animRot.value)
                                ..scale(_animScale.value),
                              child: CustomPaint(
                                size: const Size(350,350),
                                painter: MyPainter(),
                              )
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

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint();
    paint
    ..color = Colors.red
    ..style = PaintingStyle.fill
    ..strokeWidth = 3;


    Path path = Path();
    path.moveTo(size.width/6, size.height/6);
    path.lineTo(size.width/2, size.height/2);
    path.lineTo(size.width/6, size.height/2);
    path.close();

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=> false;
}