import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController _controller ; 
  Animation _animation;
  @override

  void initState(){
    _controller=AnimationController(
      vsync: this,
      duration : Duration (seconds : 1),
    );
    _animation = Tween(
      begin: 0.0,
      end:1.0
    ).animate(_controller);
    super.initState();
  }
    
   @override
   dispose(){
    _controller.dispose();
    super.dispose();

   }
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(

        body:Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _animation,
                  child: RaisedButton(
                    child: Text("Play"),
                    onPressed: (){
                      Navigator.pushNamed(context, "PlusVsMinus");
                    },
                  ),
                ),
              ),
              Padding(
                padding : EdgeInsets.only(top:8.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _animation,
                  child: RaisedButton(
                    child: Text("Options"),
                    onPressed: (){
                      Navigator.pushNamed(context, "PlusVsMinus");
                    },
                  ),
                ),
              ),
              Padding(
                padding : EdgeInsets.only(top:8.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: _animation,
                  child: RaisedButton(
                    child: Text("About"),
                    onPressed: (){
                      Navigator.pushNamed(context, "PlusVsMinus");
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
