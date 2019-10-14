import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reflectly_flutter_loginpage/delayed_animation.dart';
import 'package:reflectly_flutter_loginpage/logo.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


// login page


class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF3922E6),
          body: Center(
            child: Column(
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: LogoImage(),
                        radius: 50.0,
                      )),
                ),
                DelayedAimation(
                  child: Text(
                    "Hi There",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAimation(
                  child: Text(
                    "I'm Attendancily",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        fontFamily: 'Raleway',
                        color: color),
                  ),
                  delay: delayedAmount + 2000,
                ),
                SizedBox(
                  height: 40.0,
                ),
                DelayedAimation(
                  child: Text(
                    "Your Personal Teaching Companion",
                    style: TextStyle(
                        fontFamily: 'Raleway',                      
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 240.0,
                ),
                DelayedAimation(
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonUI,
                  ),
                ),
                delay: delayedAmount + 4000,
              ),
              SizedBox(height: 50.0,),
                DelayedAimation(
                  child: Text(
                    "All rights reserved | copyright 2019".toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  delay: delayedAmount + 5000,
                ),
              ],
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Login with Google',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3922E6),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
