import 'package:flutter/material.dart';

class MultiPlayer extends StatefulWidget {
  @override
  _MultiPlayerState createState() => _MultiPlayerState();
}

class _MultiPlayerState extends State<MultiPlayer>
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
    super.initState();
  }

  @override
  dispose() {
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
                              "Choose Number of Players",
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
                  /// 2 Player Button
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
                              child: Text(
                                "2 Players",
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),

                  /// padding Between 2 Players and 4 Players
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                  ),

                  /// 4 Players Button
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
                              child: Text(
                                "4 Players",
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context,'PlusVsMinus4P');
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
