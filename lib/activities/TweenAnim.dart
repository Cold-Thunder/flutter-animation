import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnim extends StatefulWidget{
  @override
  _TweenAnim createState()=>_TweenAnim();
}
class _TweenAnim extends State<TweenAnim> with TickerProviderStateMixin{
  late Animation animWidth;
  late Animation animHeight;
  late Animation animRad;
  late Animation animColor;
  late AnimationController animControl;

  bool isPressed = true;

  @override
  void initState(){
    super.initState;

    animControl = AnimationController(vsync: this, duration: Duration(seconds: 3));
    animWidth = Tween(begin: 200.0, end: 0.0).animate(animControl);
    animHeight = Tween(begin: 100.0, end: 0.0).animate(animControl);
    animRad = Tween(begin: 0.0, end: 50.0).animate(animControl);
    animColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(animControl);

    animControl.addListener((){
      setState((){

      });
    });
  }

  void showTween(){
    if(isPressed == true){
      animControl.forward();
    }else{
      animControl.animateBack(0.0, curve: Curves.easeIn);
    }
    setState((){
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Tween Animation Prac',
          style: TextStyle(
              fontSize: 22,
              color: Colors.white),),
        backgroundColor: Colors.brown,
        iconTheme:const IconThemeData(
          color: Colors.white
        )
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: animHeight.value,
                  width: animWidth.value,
                  decoration: BoxDecoration(
                      color: animColor.value,
                      borderRadius: BorderRadius.circular(animRad.value)
                  )
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.brown
                    ),
                    child: const Text('Show Anim',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white)),
                    onPressed: ()=>showTween(),
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}