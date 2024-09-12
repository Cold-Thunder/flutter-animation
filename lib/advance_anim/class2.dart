import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Class2 extends StatefulWidget {
  @override
  State<Class2> createState() => _Class2State();
}

class _Class2State extends State<Class2> with TickerProviderStateMixin {
  late AnimationController _clockWiseAnimationController;
  late Animation _clockWiseAnimation;

  @override
  void initState() {
    super.initState();

    try {
      _clockWiseAnimationController = AnimationController(
          vsync: this, duration: const Duration(seconds: 1));
      _clockWiseAnimation = Tween(begin: 0.0, end: -(pi / 2)).animate(
          CurvedAnimation(
              parent: _clockWiseAnimationController, curve: Curves.bounceOut));
      _clockWiseAnimationController.forward();
      _clockWiseAnimationController.repeat();
    } catch (err) {
      print(err);
    }
  }

  @override
  void dispose() {
    _clockWiseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Class 2',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black54,
        ),
        body: SafeArea(
            child: Container(
                height: height,
                width: width,
                color: Colors.grey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     AnimatedBuilder(
                       animation: _clockWiseAnimationController,
                       builder: (context, child){
                         return  Transform(
                             alignment: Alignment.center,
                             transform: Matrix4.identity()
                               ..setRotationZ(_clockWiseAnimation.value),
                             child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   ClipPath(
                                       clipper: const HalfCirclePath(
                                           side: CircleSide.left),
                                       child: Container(
                                           color: Colors.blue,
                                           height: 150,
                                           width: 150)),
                                   ClipPath(
                                       clipper: const HalfCirclePath(
                                           side: CircleSide.right),
                                       child: Container(
                                           color: Colors.yellow,
                                           height: 150,
                                           width: 150))
                                 ]));
                       }
                     )
                    ]))));
  }
}

enum CircleSide { right, left }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockWise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockWise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockWise = true;
        break;
    }
    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockWise);
    path.close();
    return path;
  }
}

class HalfCirclePath extends CustomClipper<Path> {
  final CircleSide side;
  const HalfCirclePath({required this.side});
  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
