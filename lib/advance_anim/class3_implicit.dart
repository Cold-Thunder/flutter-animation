import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Class3 extends StatefulWidget{
  @override
  State<Class3> createState()=> _Class3State();
}

class _Class3State extends State<Class3>{
  var _zoomIn = false;
  String _defaultText = 'Zoom In';
  double _defaultSize = 150.0;
  Curve _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:const Text('Class 3', style: TextStyle(
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
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 370),
                curve: _curve,
                width: _zoomIn == true ? width : _defaultSize,
                child: Image.asset('assets/images/cover.jpg')
              ),
              TextButton(
                onPressed: (){
                  setState((){
                      _zoomIn = !_zoomIn;
                      _defaultText = _zoomIn == true ? 'Zoom In' : 'Zoom Out';
                      _curve = _zoomIn == true ? Curves.bounceOut : Curves.bounceInOut;
                  });
                },
                child: Text(_defaultText, style: const TextStyle(
                  fontSize: 22,
                  color: Colors.yellow
                ))
              )
            ]
          )
        )
      )
    );
  }
}