import 'package:flutter/material.dart';
import 'package:flutter_animation/advance_anim/hero_widget.dart';

class DetailsPage extends StatelessWidget{
  final UserDetails usersDetails;
  const DetailsPage({
    required this.usersDetails,
    super.key
});

  @override
  Widget build(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: usersDetails.name,
        child: Text('${usersDetails.emoji}',
            style: const TextStyle(
          fontSize: 40
        ))),
        backgroundColor: Colors.black54,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.grey,
          child: Column(
            children: [
              SizedBox(
                child: Text('${usersDetails.name}', style:const TextStyle(
                  fontSize: 26,
                  color: Colors.white
                ))
              ),
              SizedBox(
                child: Text('${usersDetails.age}', style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white
                ))
              )
            ]
          )
        )
      )
    );
  }
}