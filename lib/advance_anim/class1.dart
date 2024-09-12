import 'dart:math';

import 'package:flutter/material.dart';

class Class1 extends StatefulWidget {
  @override
  State<Class1> createState() => _Class1State();
}

class _Class1State extends State<Class1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    try {
      _controller = AnimationController(
          vsync: this, duration: const Duration(seconds: 2));
      _animation = Tween(begin: 0.0, end: pi).animate(_controller);

      _controller.forward();
      _controller.repeat();
    } catch (err) {
      print(err);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            title: const Text("Advance Animation",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.black54),
        body: SafeArea(
            child: Container(
                height: height,
                width: width,
                color: Colors.grey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child){
                            return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..rotateZ(_animation.value),
                                child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: const Offset(0, 3),
                                              spreadRadius: 3,
                                              blurRadius: 3)
                                        ])));
                          })
                    ]))));
  }
}
