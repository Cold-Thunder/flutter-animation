import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation/activities/clippath_pac.dart';
import 'package:flutter_animation/advance_anim/class1.dart';
import 'package:flutter_animation/advance_anim/class2.dart';
import 'package:flutter_animation/advance_anim/class3_implicit.dart';
import 'package:flutter_animation/advance_anim/class4_clipping_path.dart';
import 'package:flutter_animation/advance_anim/hero_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ClippingPath()
    );
  }
}

