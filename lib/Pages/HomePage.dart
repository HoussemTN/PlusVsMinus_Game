import 'package:flutter/material.dart';
import '../library/globals.dart'as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;


  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    globals.player.loadAll(['clic.wav']);
    super.initState();
  }

  @override
  dispose() {
    /// audio Dispose
     globals.player.clearCache();
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 10,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _animation,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    color: Colors.indigo,
                    highlightColor: Colors.blue,
                    splashColor: Colors.blueAccent,
                    child: Text(
                      "Single Game",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    onPressed: () {
                      globals.player.play('clic.wav');
                      Navigator.pushNamed(context, "SinglePlayer");
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 10,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _animation,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    color: Colors.indigo,
                    highlightColor: Colors.blue,
                    child: Text(
                      "Mutliplayer Game",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    onPressed: () {
                      globals.player.play('clic.wav');
                      Navigator.pushNamed(context, "Gamemode");
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.7,
                height: MediaQuery.of(context).size.height / 10,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _animation,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    color: Colors.indigo,
                    highlightColor: Colors.blue,
                    child: Text(
                      "Options",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    onPressed: () {
                      globals.player.play('clic.wav');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
