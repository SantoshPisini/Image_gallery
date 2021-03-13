import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/Base.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offset;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(_controller);
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        _opacity = _opacity == 0.0 ? 1.0 : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/landing.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 1200),
                    opacity: _opacity,
                    child: Column(
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(color: Colors.white, fontSize: 64),
                        ),
                        Text(
                          "Nature",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                  SlideTransition(
                    position: _offset,
                    child: SizedBox(
                      width: 182,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Base()),
                          )
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          elevation: MaterialStateProperty.all<double>(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Let\'s begin',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
