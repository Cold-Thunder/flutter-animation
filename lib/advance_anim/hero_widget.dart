import 'package:flutter/material.dart';
import 'package:flutter_animation/advance_anim/details_page.dart';

class UserDetails{
  late String name;
  late int age;
  late String emoji;

  UserDetails({
    required this.name,
    required this.age,
    required this.emoji
});
}

List users = [
  UserDetails(name: 'Jhone', age: 25, emoji: '🙋‍♂️'),
  UserDetails(name: 'Adison', age: 27, emoji: '🤴'),
  UserDetails(name: 'Thomas', age: 30, emoji: '👨‍✈️️')
];

class HeroWidget extends StatefulWidget{
  @override
  State<HeroWidget> createState()=> _StateHeroWidget();
}

class _StateHeroWidget extends State<HeroWidget>{
    @override
    Widget build(BuildContext context){
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Hero Widget', style: TextStyle(
            fontSize: 24,
            color: Colors.white
          )),
          backgroundColor: Colors.black54,
        ),
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            color: Colors.grey,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index){
                return ListTile(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>DetailsPage(usersDetails: users[index]))
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  leading:
                  Hero(
                    tag: users[index].name,
                    flightShuttleBuilder: (
                        flightContext,
                        animation,
                        flightDirection,
                        fromHeroContext,
                        toHeroContext
                        ){
                        switch(flightDirection){
                          case HeroFlightDirection.pop:
                            return Material(
                              color: Colors.transparent,
                               child: ScaleTransition(
                                   scale: animation.drive(
                                       Tween<double>(begin: 3, end: 1)
                                   ),
                                child: fromHeroContext.widget
                               )
                            );
                          case HeroFlightDirection.push:
                            return Material(
                              color: Colors.transparent,
                               child: ScaleTransition(
                                 scale: animation.drive(
                                   Tween<double>(begin: 3, end: 1)
                                 ),
                                 child: toHeroContext.widget
                               )
                            );
                        };

                    },
                  child:Text('${users[index].emoji}', style: const TextStyle(
                    fontSize: 40
                  ))),
                  title: Text('${users[index].name}', style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white
                  )),
                  subtitle: Text('Age: ${users[index].age}', style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  )),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 28, color: Colors.white),
                );
              }
            )
          )
        )
      );
    }
}