import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnim extends StatefulWidget{
  @override
  _TweenAnim createState()=> _TweenAnim();
}
class _TweenAnim extends State<TweenAnim> with TickerProviderStateMixin{
  late Animation animSize;
  late Animation animColor;
  late AnimationController animControl;

  bool isPressed = true;

  @override
  void initState(){
    super.initState;
    animControl = AnimationController(vsync: this, duration: Duration(seconds: 4));
    animSize = Tween(begin: 0.0, end: 200.0).animate(animControl);
    animColor = ColorTween(begin: Colors.red, end: Colors.blue).animate(animControl);

    animControl.addListener((){
      setState((){

      });
    });
    // animControl.forward();
  }

  void showTween(){
    if(isPressed == true){
      animControl.forward();
      setState((){
        isPressed = false;
      });
    }else{
      animControl.animateBack(0.0, duration: Duration(seconds: 2), curve: Curves.easeIn);
      setState((){
        isPressed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Tween Anim',
            style: TextStyle(
                fontSize: 22,
                color: Colors.white)),
        backgroundColor: Colors.brown,
        iconTheme: const IconThemeData(
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
                  height: animSize.value,
                  width: animSize.value,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  animColor.value,
                  )
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    child: const Text('Show Tween',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white)),
                    onPressed: (){
                      showTween();
                    }
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