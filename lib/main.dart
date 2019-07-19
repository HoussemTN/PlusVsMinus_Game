import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedpusher/Pages/HomePage.dart';
import 'package:speedpusher/Pages/SplashScreen.dart';
import 'Pages/MultiPlayer.dart';
import 'package:speedpusher/MultiPlayerMode/PlusVsMinus.dart';
import 'package:speedpusher/MultiPlayerMode/PlusVsMinus4P.dart';
import 'package:speedpusher/SinglePlayerMode/SingleGameEasy.dart';
import 'package:speedpusher/SinglePlayerMode/SingleGameMedium.dart';
import 'package:speedpusher/SinglePlayerMode/SingleGameHard.dart';

import 'Pages/SinglePlayer.dart';
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
        'PlusVsMinus4P':(context)=>PlusVsMinus4P(),
        'Gamemode':(context)=>MultiPlayer(),
        'SinglePlayer':(context)=>SinglePlayer(),
        'SingleGameEasy':(context)=>SingleGameEasy(),
        'SingleGameMedium':(context)=>SingleGameMedium(),
        'SingleGameHard':(context)=>SingleGameHard(),
      },
      home: SplashPage(),
    );
  }
}


