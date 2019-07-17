import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            () => Navigator.pushReplacementNamed(context, "Home"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: 144,
              height: 144,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "PlusVsMinus",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}