import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../library/globals.dart' as globals;


class PlusVsMinus extends StatefulWidget {
  @override
  _PlusVsMinusState createState() => _PlusVsMinusState();
}

class _PlusVsMinusState extends State<PlusVsMinus> {
  /// Variables initialization
  int _counter = 50;
  // ignore: unused_field
  bool _gameOver = false;
  bool _plusWinner = false;
  // ignore: unused_field
  bool _minusWinner = false;

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
          color: Colors.red,
        ),
      ),
      type: AlertType.none,
      title: "Game Over",
      desc: _plusWinner == true ? "Plus is The Winner" : "Minus is The Winner",
      buttons: [
        DialogButton(

          child: Text(
            "Menu",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
           // Navigator.pushNamed(context, "Home");
            Navigator.of(context).pushNamedAndRemoveUntil("Home",(Route<dynamic> route) => false);

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
      setState(() {
        _counter=_counter+4;
      });
      if (_counter >= 100) {
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
    if (_counter != 0 && _counter != 100) {
      setState(() {
        _counter=_counter-4;
      });
      if (_counter <= 0) {
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
    if (_gameOver = true) {
       globals.player.play( _plusWinner == true ? "victory.wav" : "laugh.wav");
      _showDialog(_plusWinner == true ? "Plus is the Winner" : "Minus is the Winner");
    }
  }
  /// Reset Variables to their initial State
  void _reset() {
    setState(() {
      _plusWinner = false;
      _minusWinner = false;
      _counter = 50;
      _gameOver = false;
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
  void dispose() {
    globals.player.clear('victory.wav');
    super.dispose();
  }

 @override
  void initState() {
    globals.player.load('victory.wav');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///TODO Test top Phone App bar Overlays
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(),
        sized: false,
        child:
      Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new FloatingActionButton(
                      heroTag: "Minus",
                      onPressed: () => _decrementCounter(),
                      child: new Icon(Icons.remove),
                      backgroundColor: Colors.red,
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
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "Plus",
          onPressed: _incrementCounter,
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.green,
        ),
      ),

    );
  }
}
