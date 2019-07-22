import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../library/globals.dart' as globals;

class SingleGameMedium extends StatefulWidget {
  @override
  _SingleGameMediumState createState() => _SingleGameMediumState();
}

class _SingleGameMediumState extends State<SingleGameMedium> {
  /// Variables initialization
  int _counter = 50;
  // ignore: unused_field
  bool _gameOver = false;
  bool _plusWinner = false;
  // ignore: unused_field
  bool _minusWinner = false;
  bool _gameStarted = false ;
  Timer timer;
  /// Show a Alert Dialog
  void _showDialog(String body) {
    Alert(
      context: context,
      style: AlertStyle(
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: _plusWinner == true ? Colors.green : Colors.red,
        ),
      ),
      type: AlertType.none,
      title: _plusWinner == true ? "Victory" : "Defeat",
      desc: _plusWinner == true ? "You Win" : "You lose",
      buttons: [
        DialogButton(
          child: Text(
            "Menu",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "Home");
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
        DialogButton(
          child: Text(
            "Play Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _reset();
            Navigator.pop(context);
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  /// Plus Counter
  void _incrementCounter() {

    if (_counter != 0 && _counter != 100) {
      if (!mounted) return;
      setState(() {
        _gameStarted=true;
        _counter=_counter+4;
      });
      if (_counter >= 100) {
        if (!mounted) return;
        setState(() {
          _plusWinner = true;
          _gameOver = true;
        });

        gameOver();
      }
    }
  }
  /// Minus Counter
  void _decrementCounter() {
    if (_counter != 0 && _counter != 100 && _gameStarted==true) {
      if (!mounted) return;
      setState(() {
        _counter=_counter-13;
      });
      if (_counter <= 0) {
        if (!mounted) return;
        setState(() {
          _minusWinner = true;
          _gameOver = true;
        });

        gameOver();
      }
    }
  }

  /// Call The Alert Dialog And Show The Winner
  gameOver() {
    globals.player.play(_plusWinner == true ? 'victory.wav' : 'defeat.wav');
    if (_gameOver == true) {
      timer?.cancel();
      _showDialog(_plusWinner == true ? "Plus is the Winner" : "Minus is the Winner");
    }
  }
  /// Reset Variables to their initial State
  void _reset() {
    setState(() {
      timer = Timer.periodic(
          Duration( milliseconds: 350 ), (Timer t) => _decrementCounter( ) );
      _plusWinner = false;
      _minusWinner = false;
      _counter = 50;
      _gameOver = false;
      _gameStarted=false;

    });
  }

  int valueChanger() {
    int L;
    if (_counter >= 60 && _counter <= 100) {
      L = 60;
    }
    if (_counter <= 40 && _counter >= 0) {
      L = 10;
    }
    return L;
  }


  @override
  void initState() {
    globals.player.loadAll(['defeat.wav','victory.wav']);
    super.initState();
    if(!_gameOver) {
      timer = Timer.periodic(
          Duration( milliseconds: 350 ), (Timer t) => _decrementCounter( ) );
    }else{ timer.cancel();}

  }

  @override
  void dispose() {
    globals.player.clearCache();
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.indigo,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.yellowAccent,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Expanded(child:
                  Container(),),
                  Row(
                    children: <Widget>[
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.display1,),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: FAProgressBar(
                  backgroundColor: Colors.greenAccent[100],
                  size: MediaQuery.of(context).size.width / 1.01,
                  borderRadius: 20.0,
                  direction: Axis.vertical,
                  verticalDirection: VerticalDirection.up,
                  currentValue: _counter,
                  displayText: '%',
                  maxValue: 100,
                  changeColorValue: valueChanger(),
                  progressColor: _counter > 10 ? Colors.blue : Colors.red,
                  changeProgressColor: _counter >= 50 ? Colors.green : Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "Plus",
                    onPressed: _incrementCounter,
                    child: Icon(
                      Icons.add,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
