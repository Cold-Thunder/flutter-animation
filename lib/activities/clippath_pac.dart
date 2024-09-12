import 'package:flutter/material.dart';

class ClipPathPrac extends StatefulWidget{
  const ClipPathPrac({super.key});
  @override
  State<ClipPathPrac> createState()=> _ClipPathState();
}

class _ClipPathState extends State<ClipPathPrac>{
  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: ClipperPath(),
              child: Container(
                height: 200,
                  width: 200,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(1,2),
                      blurRadius: 3,
                      spreadRadius: 3
                    )
                  ]
                )
              )
            )
          ]
        ))
      )
    );
  }
}

class ClipperPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path = Path();
    path.lineTo(30,0);
    path.lineTo(size.width-30, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(30, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}





