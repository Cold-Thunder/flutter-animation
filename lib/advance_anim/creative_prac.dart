import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreativePrac extends StatefulWidget{
  @override
  State<CreativePrac> createState()=> _CreativePracState();
}

class _CreativePracState extends State<CreativePrac> with TickerProviderStateMixin{
  late AnimationController _moveAnimCont;
  late Animation _moveAnim;

  late AnimationController _radiusAnimCont;
  late Animation _radiusAnim;

  @override
  void initState(){
    super.initState();

    _moveAnimCont = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _moveAnim = Tween(begin: 0, end: 1).animate(_moveAnimCont);


    _radiusAnimCont = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _radiusAnim = Tween(begin: 3.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _radiusAnimCont,
        curve: Curves.bounceInOut
      )
    );
    _radiusAnimCont.forward();
    _radiusAnimCont.repeat(reverse: true);
  }

  @override
  void dispose(){
    _moveAnimCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final width =MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ball Animation', style: TextStyle(
          fontSize: 24,
          color: Colors.white
        )),
        backgroundColor: Colors.black54
      ),
      body: SafeArea(child: Container(
        height: height,
        width: width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  _radiusAnimCont
                ]),
                builder: (context, child){
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity(),
                    child: CustomPaint(
                      painter: MyPainter(radius: _radiusAnim.value),
                      child: SizedBox(
                        height: 550,
                        width: width,
                      )
                    )
                  );
                }
              ))
          ]
        )
      ))
    );
  }
}


class MyPainter extends CustomPainter{
  double  radius;
  MyPainter({
    required this.radius
});

  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint();
    paint
    ..color= Colors.blue
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.fill;

    Path path = Path();

    var center = Offset(size.width/2, size.height/2);

    canvas.drawCircle(center, radius, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=> true;
}