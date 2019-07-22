import 'package:flutter/material.dart';
import '../library/globals.dart' as globals;
class SinglePlayer extends StatefulWidget {
  @override
  _SinglePlayerState createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer>
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
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Colors.indigo,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.yellowAccent,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 8),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 12,
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: _animation,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        elevation: 5,
                        highlightColor: Colors.blue,
                        splashColor: Colors.blueAccent,
                        child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Choose The Difficulty",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ],
                            )),
                        onPressed: null,
                      ),
                    ),
                  ),

                  /// Padding between Tip and 1 Player Button
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                  ),

                  /// Padding Between 1 player Button and 2 Players Button
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                  ),
                  /// Single Game Easy
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 9,
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: _animation,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        color: Colors.indigo,
                        highlightColor: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 40.0,
                              child: Image.asset(
                                  "assets/images/game-controller.png"),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 6.0, left: 8.0),
                              child: Container(
                                width: 100,
                                child: Text(
                                  "Easy",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          globals.player.play('clic.wav');
                          Navigator.pushNamed(context,'SingleGameEasy');
                        },
                      ),
                    ),
                  ),

                  /// padding Between Easy and Medium
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                  ),

                  /// Medium Button
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 9,
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: _animation,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        color: Colors.indigo,
                        highlightColor: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 40.0,
                                width: 40.0,
                                child: Image.asset(
                                    "assets/images/game-controller.png")),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 6.0, left: 8.0),
                              child: Container(
                                width: 100,
                                child: Text(
                                  "Medium",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          globals.player.play('clic.wav');
                          Navigator.pushNamed(context,'SingleGameMedium');
                        },
                      ),
                    ),
                  ),

                  /// padding Between Medium and Hard
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                  ),

                  /// Hard Button
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 9,
                    child: ScaleTransition(
                      alignment: Alignment.center,
                      scale: _animation,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        color: Colors.indigo,
                        highlightColor: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 40.0,
                                width: 40.0,
                                child: Image.asset(
                                    "assets/images/game-controller.png")),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 6.0, left: 8.0),
                              child: Container(
                                width: 100,
                                child: Text(
                                  "Hard",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          globals.player.play('clic.wav');
                          Navigator.pushNamed(context,'SingleGameHard');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ), //end Center
          ],
        ),
      ),
    );
  }
}
