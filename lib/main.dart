import 'package:divvy/Login/loginpage.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divvy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /* Must specify FULL 8 Hexadecimals (0xFF------ means 100% opague)
            - Dark Color that I like 0xFF353535
        */
        primaryColor: new Color(0xFFA63D40),
        primaryIconTheme: IconThemeData(color: const Color(0xFFE0F2E9)),
        primaryTextTheme: TextTheme(title: TextStyle(color: const Color(0xFFE0F2E9))),
        textTheme: TextTheme(title: TextStyle(color: const Color(0xFFE0F2E9))),
      ), 

      home: new LoginPage()
    );
  }
}