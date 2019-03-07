import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'loginpage.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  final Widget child;

  SplashScreen({Key key, this.child}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(
      seconds: 3
    ),(){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginPage()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: new Color(0xFFA63D40)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: new Color(0xFF1D1E18),
                radius: 50.0,
                child: Icon(
                  FontAwesomeIcons.cookieBite,
                  color: new Color(0xFFE0F2E9),
                  size: 50.0
                )
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text("Divvy", style:TextStyle( fontSize: 50.0, color: new Color(0xFFE0F2E9)))
            ],
          )
        ],
      )
    );
  }
}