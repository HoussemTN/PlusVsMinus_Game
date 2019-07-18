import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedpusher/Pages/HomePage.dart';
import 'package:speedpusher/Pages/SplashScreen.dart';
import 'Pages/GamemodeMenu.dart';
import 'PlusVsMinus.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'Home':(context)=>HomePage(),
        'PlusVsMinus':(context)=>PlusVsMinus(),
        'Gamemode':(context)=>GamemodeMenu(),
      },
      home: SplashPage(),
    );
  }
}


