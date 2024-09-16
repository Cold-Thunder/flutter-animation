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

  late Animation _animSides;
  late AnimationController _animContSides;

  @override
  void initState(){
    super.initState();
    try{
      _animContRot =  AnimationController(vsync: this, duration: const Duration(seconds: 3));
      _animRot = Tween(begin: 0.0, end: 2*pi).animate(_animContRot);
      _animContRot.forward();
      _animContRot.repeat();

      _animScaleCont = AnimationController(vsync: this, duration: const Duration(seconds: 3));
      _animScale = Tween(begin: 50.0, end: 350.0).animate(
        CurvedAnimation(
          parent: _animScaleCont,
          curve: Curves.bounceInOut
        )
      );
      _animScaleCont.forward();
      _animScaleCont.repeat(reverse: true);

      _animContSides = AnimationController(vsync: this, duration: const Duration(seconds: 3));
      _animSides = IntTween(begin: 3, end: 10).animate(_animContSides);
      _animContSides.forward();
      _animContSides.repeat(reverse: true);
    }catch(err){
      print(err);
    }
  }

  @override
  void dispose(){
    _animContRot.dispose();
    _animContSides.dispose();
    _animScaleCont.dispose();

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
                          _animScaleCont,
                          _animContSides,
                          _animContRot,
                        ]),
                        builder: (context, child){
                          return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..rotateZ(_animRot.value)
                                ..rotateX(_animRot.value)
                                ..rotateY(_animRot.value),
                              child: CustomPaint(
                                painter: MyPainter(sides: _animSides.value),
                                child: SizedBox(
                                  height: _animScale.value,
                                  width: _animScale.value
                                )
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
  int sides;

  MyPainter({
    required this.sides
});

  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint();
    paint
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;


    Path path = Path();
    final center = Offset(size.width/2, size.width/2);
    final angel = (2*pi)/sides;
    final angels = List.generate(sides, (index)=>index*angel);
    final radius = size.width/2;

    path.moveTo(
      center.dx + radius*cos(0),
      center.dy + radius*sin(0)
    );

    for(double angle in angels){
      path.lineTo(
        center.dx + radius*cos(angle),
        center.dy + radius*sin(angle)
      );
    }

    path.close();

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=> false;
}