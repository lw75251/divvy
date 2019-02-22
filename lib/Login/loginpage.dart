import 'package:divvy/Login/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.user,
      builder: (context, snapshot) {
        if( snapshot.hasData ) {
          return MaterialButton(
              onPressed: () => authService.googleSignIn(),
              child: Text("Login with Google")
            );
        } else {
          return MaterialButton(
              onPressed: () => authService.signOut(),
              child: Text("Login with Google")
            );
        }
      }
    );
  }
}

class LoginPage extends StatelessWidget {

  final topBar = new AppBar(
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon( Icons.account_balance_wallet ),
    title : new Text("Divvy", style: TextStyle(fontWeight: FontWeight.bold)),
    actions: <Widget>[
      new IconButton(
        icon: new Icon(FontAwesomeIcons.signInAlt),
        tooltip: "Sign In",
        onPressed: (){},
      )
    ],

  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () => authService.googleSignIn(),
              child: Text("Login with Social Media")
            ),
            MaterialButton(
              onPressed: () => authService.signOut(),
              child: Text("Sign Out")
            )
          ],
        ),
      ),
    );
  }
}